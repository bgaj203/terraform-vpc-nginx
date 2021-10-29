output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
  description = "aws public subnet id"
}

output "aws_security_group_id" {
  value = aws_security_group.aws_security_group_ssh_allowed.id
  description = "aws security group id"
}