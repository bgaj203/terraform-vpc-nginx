variable "aws_vpc_id" {
  type = string
  description = "aws vpc instnace id. This is automatically being referenced from aws/aws_vpc/outputs.tf"
}

variable "aws_subnet_cidr" {
  type = string
  description = "cidr block for the vpc public subnet"
  default = "10.0.1.0/24"
}

variable "map_public_ip_on_launch" {
  type = bool
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
  default = true
}

variable "aws_subnet_availability_zone" {
  type = string
  description = "The AZ for the subnet"
  default = "us-west-2a"
}

variable "environment_name" {
  type = string
  description = "Name of the project environment"
  
}

variable "project_name" {
  type = string
  description = "Name of the project"
  
}

variable "ssh_ip_address" {
  type = string
  description = "The ip address cidr block a user can SSH into the EC2 instnace from. use 0.0.0.0/0 if you don't know this"
}
