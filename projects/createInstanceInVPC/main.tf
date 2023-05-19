#Cloud Service Provider Information
provider "aws" {
    region = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

module "vpc_module" {
    source = "../../modules/vpc_module"

    vpc_cidr_block = "10.0.0.0/16"
    custom_vpc_name = "prod-vpc"
}

module "subnet_module" {
    source = "../../modules/subnet_module"

    vpc_id = module.vpc_module.vpc_id
    subnet_cidr_block = "10.0.0.0/24"
    custom_subnet_name = "prod-subnet"
}

module "instance_module" {
    source = "../../modules/instance_module"

    instance_type = "t2.micro"
    instance_name = "prod-ui-server"
    subnet_id = module.subnet_module.subnet_id
}
