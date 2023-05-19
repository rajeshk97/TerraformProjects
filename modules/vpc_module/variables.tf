variable "custom_vpc_name" {
    description = "name for custom vpc"
    type = string
    default = "custom-vpc"
}

variable "vpc_cidr_block" {
    description = "cidr block for custom vpc"
    type = string
    default = "10.0.0.0/16"
}