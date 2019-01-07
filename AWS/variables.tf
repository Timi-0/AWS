#------aws credential variables----
variable "aws_region" {}
variable "access_key" {}
variable "secret_key" {}

#-----networking variables ---
variable "vpc_cidr" {}

variable "public_cidrs" {
  type = "list"
}

variable "private_cidrs" {
  type = "list"
}

variable "accessip" {}

#------compute variables ---

variable "instance_count" {
  default = 1
}

variable "server_instance_type" {}
