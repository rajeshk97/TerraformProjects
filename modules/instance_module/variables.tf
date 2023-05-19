variable "instance_ami_id" {
    description = "ami id for the standard os flavour and version across organization"
    type = string
    default = "ami-0b08bfc6ff7069aff"
}

variable "instance_type" {
    description = "standard instance type across organization"
    type = string
    default = "t2.micro"
}

variable "instance_name" {
    description = "standard instance name across organization"
    type = string
    default = "ui-server"
}

variable "subnet_id" {
    description = "subnet id where server to be created"
    type = string
    default = "subnet-0e9b53d75928fb789"
}