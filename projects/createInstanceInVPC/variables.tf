variable "aws_region" {
    description = "default region for aws account"
    type = string
    default = "ap-south-1"
}

variable "aws_access_key" {
  description = "access key for aws account"
  type = string
  default = ""
}

variable "aws_secret_key" {
    description = "secret key for aws account"
    type = string
    default = ""
}