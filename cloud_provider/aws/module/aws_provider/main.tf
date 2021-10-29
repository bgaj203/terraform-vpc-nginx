provider "aws" {
  region  = var.aws_region
  default_tags {
      tags = {
          Environment = var.aws_project_environment
      }
    }
}