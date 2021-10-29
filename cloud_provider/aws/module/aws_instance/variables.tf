variable "ami_intance_id" {
  type = string
  description = "ami instance id for the ec2 machine image"
}

variable "instance_type" {
  type = string
  description = "machine type. t2.micor is free to run"
}

variable "project_name" {
  type = string
  description = "Name of the project"
}

variable "public_subnet_id" {
  type = string
  description = "This is the subnet id of the VPC subnet. Must be available in vpc_network modute output.tf"
}


variable "ssh_allowed_vpc_security_group_id" {
  type = string
  description = "This is the network security group id of the VPC subnet. Must be available in vpc_network modute output.tf"
}

variable "aws_key_pair_id" {
  type = string
  description = "aws public key"
}

variable "nginx_script_file" {
  type = string
  description = "nginx script file path"
}

variable "PRIVATE_KEY_PATH" {
  type = string
  description = "path to the aws private key"
}