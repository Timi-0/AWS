variable "aws_region" {}

#-----storage variables ---
variable "project_name" {}

#-----networking variables ---
variable "vpc_cidr" {}

variable "public_cidrs" {
  type = "list"
}

variable "accessip" {}

#------compute variables ---
variable "key_name" {}

variable "public_key_path" {}

variable "instance_count" {
  default = 1
}

variable "server_instance_type" {}
