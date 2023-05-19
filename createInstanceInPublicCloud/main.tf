provider "aws" {
    region = "ap-south-1"
    access_key = ""
    secret_key = ""
}

#Create an EC2 instance

resource "aws_instance" "nonprod-ui-server" {
    ami = "ami-0b08bfc6ff7069aff"
    instance_type = "t2.micro"
    tags = {
        Name = "nonprod-ui-server"
    }
}

# #Create a new Virtual Private Cloud
# resource "aws_vpc" "nonprod-vpc" {
#     cidr_block = "10.0.0.0/16"
#     tags = {
#         Name = "nonprod-vpc"
#     }
# }

# #Create an internet gateway
# resource "aws_internet_gateway" "nonprod-gateway" {
#     vpc_id = aws_vpc.nonprod-vpc.id
# }