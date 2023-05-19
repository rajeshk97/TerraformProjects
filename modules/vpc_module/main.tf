#Create a custom VPC
resource "aws_vpc" "custom-vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name: var.custom_vpc_name
    }
}