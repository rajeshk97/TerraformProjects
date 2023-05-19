#Create an EC2 instance
resource "aws_instance" "server" {
    ami = var.instance_ami_id
    instance_type = var.instance_type
    tags = {
        Name = var.instance_name
    }
}
