resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_ciderblock
  instance_tenancy = var.vpc_instance_tenancy
  enable_dns_support = var.vpc_dns_support
  enable_dns_hostnames = var.vpc_dns_hostnames
  enable_classiclink = var.vpc_classiclink

  tags = {
    Name = "${var.project_name}_${var.environment_name}_vpc"
  }
}