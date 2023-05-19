#Create a custom subnet
resource "aws_subnet" "custom-subnet" {
    vpc_id = var.vpc_id
    cidr_block = var.subnet_cidr_block
    tags = {
        Name: var.custom_subnet_name
    }
}