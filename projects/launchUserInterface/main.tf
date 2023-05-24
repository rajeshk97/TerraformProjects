provider "aws" {
    region = "ap-south-1"
    access_key = ""
    secret_key = ""
}

resource "aws_vpc" "prod-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "prod"
    }
}

resource "aws_internet_gateway" "prod-gw" {
    vpc_id = aws_vpc.prod-vpc.id
}

resource "aws_route_table" "prod_route_table" {
    vpc_id = aws_vpc.prod-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.prod-gw.id
    }

    route {
        ipv6_cidr_block = "::/0"
        gateway_id = aws_internet_gateway.prod-gw.id
    }

    tags = {
        Name = "prod"
    }
}

resource "aws_subnet" "subnet-1" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1a"

    tags = {
        Name = "prod"
    }
}

resource "aws_route_table_association" "rt-a-subnet" {
    subnet_id = aws_subnet.subnet-1.id
    route_table_id = aws_route_table.prod_route_table.id
}

resource "aws_security_group" "prod-security-group" {
    name = "allow_web_traffic"
    description = "allow web traffic"
    vpc_id = aws_vpc.prod-vpc.id

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "https"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
        Name = "allow_web"
    }
}

resource "aws_network_interface" "prod-nic" {
    subnet_id = aws_subnet.subnet-1.id
    private_ips = ["10.0.0.50"]
    security_groups = [aws_security_group.prod-security-group.id]
}

resource "aws_eip" "prod-eip" {
    vpc = true
    network_interface = aws_network_interface.prod-nic.id
    associate_with_private_ip = "10.0.0.50"
    depends_on = [ aws_internet_gateway.prod-gw ]
}

resource "aws_instance" "web_server" {
    ami = "ami-0b08bfc6ff7069aff"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1a"
    key_name = "prod-server-key"
    network_interface {
        device_index = 0
        network_interface_id = aws_network_interface.prod-nic.id
    }

    user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo bash -c 'echo This is a UI server created using Terraform > /var/www/html/index.html'
                EOF
    
    tags = {
        Name = "web-server"
    }
}