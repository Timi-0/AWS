#-------compute/variables.tf-------

variable "subnet_ips" {
  type = "list"
}

variable "instance_count" {}
variable "instance_type" {}
variable "security_group" {}

variable "publicsubnets" {
  type = "list"
}

variable "privatesubnets" {
  type = "list"
}

