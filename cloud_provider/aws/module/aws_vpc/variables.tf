variable "vpc_ciderblock" {
  type = string
  description = "The CIDR block for the VPC. This is a required value"
}

variable "vpc_instance_tenancy" {
  type = string
  description = "A tenancy option for instances launched into the VPC. Default is default, which makes your instances shared on the host. Using either of the other options (dedicated or host) costs at least $2/hr."
  default = "default"
}

variable "vpc_dns_support" {
  type = bool
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults true."
  default = true
}

variable "vpc_dns_hostnames" {
  type = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults true."
  default = true
}

variable "vpc_classiclink" {
    type = bool
    description = "A boolean flag to enable/disable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic. Defaults false"
    default = false
}

variable "environment_name" {
  type = string
  description = "Name of the project environment"
  default = null
}

variable "project_name" {
  type = string
  description = "Name of the project"
  default = null
}
