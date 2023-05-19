output "subnet_id" {
    description = "returns the id of subnet created using this module"
    value = aws_subnet.custom-subnet.id
}