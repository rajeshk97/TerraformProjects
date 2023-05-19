provider "aws" {
    region = "ap-south-1"
    access_key = ""
    secret_key = ""
}

#Create an EC2 instance
module "instance_module" {
    source = "../../modules/instance_module"

    instance_name = "public-cloud-server"
}