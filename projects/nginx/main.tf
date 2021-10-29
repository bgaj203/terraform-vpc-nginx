locals {
  environment_label = var.project_environemnt
  project_label     = var.project_name
}

# module "aws_provider_module" {
#   source                  = "../../cloud_provider/aws/module/aws_provider"
#   aws_region              = "us-west-2"
#   aws_project_environment = local.environment_label
# }

provider "aws" {
  region  = "us-west-2"
  default_tags {
      tags = {
          Environment = local.environment_label
      }
    }
}

module "aws_vpc_module" {
  source           = "../../cloud_provider/aws/module/aws_vpc"
  project_name     = local.project_label
  environment_name = local.environment_label
  vpc_ciderblock   = "10.0.0.0/16"
}

module "aws_vpc_network_module" {
  source           = "../../cloud_provider/aws/module/aws_vpc_network"
  project_name     = local.project_label
  environment_name = local.environment_label
  aws_vpc_id       = module.aws_vpc_module.aws_vpc_id
  ssh_ip_address   = "0.0.0.0/0"
}

module "aws_key_pair_module" {
  source = "../../cloud_provider/aws/module/aws_key_pair"
}

module "aws_instance_module" {
  source                            = "../../cloud_provider/aws/module/aws_instance"
  ami_intance_id                    = "ami-08d70e59c07c61a3a"
  instance_type                     = "t2.micro"
  project_name                      = local.project_label
  public_subnet_id                  = module.aws_vpc_network_module.public_subnet_id
  ssh_allowed_vpc_security_group_id = module.aws_vpc_network_module.aws_security_group_id
  aws_key_pair_id                   = module.aws_key_pair_module.aws_key_pair_id
  nginx_script_file                 = var.nginx_script_file
  PRIVATE_KEY_PATH                  = var.PRIVATE_KEY_PATH
}
