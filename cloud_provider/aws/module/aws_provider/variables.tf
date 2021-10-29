variable "aws_region" {
  type        = string
  description = "project environment name"
}

variable "aws_project_environment" {
  type = string
  description = "The project environment type. This can be DEV, UAT, QA, PREPROD, PROD"
}