variable "project_environemnt" {
  type        = string
  description = "project environment name"
  default = "dev"
}

variable "project_name" {
  type        = string
  description = "project name"
  default = "nginx"
}

variable "PRIVATE_KEY_PATH" {
  default = "aws-key"
}

variable "nginx_script_file" {
  type    = string
  default = "nginx.sh"
}