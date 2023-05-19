output "vpc_id" {
    description = "returns the id of vpc creted using this module"
    value = aws_vpc.custom-vpc.id
}
