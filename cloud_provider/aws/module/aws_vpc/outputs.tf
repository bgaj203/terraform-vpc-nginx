output "aws_vpc_id" {
  value = aws_vpc.vpc.id
  description = "ID of the aws_vpc that was created"
  sensitive = true
}

output "aws_vpc_cidr_list" {
  value = aws_vpc.vpc.cidr_block
}