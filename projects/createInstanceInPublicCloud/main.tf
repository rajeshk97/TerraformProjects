provider "aws" {
    region = "ap-south-1"
    access_key = "AKIAWNYNRB4QG3T5IF2S"
    secret_key = "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"
}

#Create an EC2 instance
module "instance_module" {
    source = "../../modules/instance_module"

    instance_name = "public-cloud-server"
}