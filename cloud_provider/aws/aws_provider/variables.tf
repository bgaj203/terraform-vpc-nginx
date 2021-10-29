variable "aws_region" {
  type = string
  description = "The region the aws resources need to be created"
  default = null
}

variable "aws_project_environment" {
  type = string
  description = "The project environment type. This can be DEV, UAT, QA, PREPROD, PROD"
  default = null
}