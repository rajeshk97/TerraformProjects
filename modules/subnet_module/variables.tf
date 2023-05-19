variable "custom_subnet_name" {
    description = "name of the new subnet being created"
    type = string
    default = "custom-subnet"
}

variable "subnet_cidr_block" {
    description = "cidr block for subnet"
    type = string
    default = "10.0.0.0/24"
}

variable "vpc_id" {
    description = "id of the vpc in which subnet to be created"
    type = string
    default = "vpc-08c7c11a1437c0859"
}
