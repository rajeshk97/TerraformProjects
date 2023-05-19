#Create an EC2 instance
resource "aws_instance" "server" {
    ami = var.instance_ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    tags = {
        Name = var.instance_name
    }
}
