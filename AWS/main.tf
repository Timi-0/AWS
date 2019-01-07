provider "aws" {
  region = "${var.aws_region}"
  secret_key = "${var.secret_key}"
  access_key = "${var.access_key}"
}

# Deploy Networking Resources

module "networking" {
  source       = "./networking"
  vpc_cidr     = "${var.vpc_cidr}"
  public_cidrs = "${var.public_cidrs}"
  private_cidrs = "${var.private_cidrs}"
  accessip     = "${var.accessip}"
}

# Deploy Compute Resources
module "compute" {
  source          = "./compute"
  instance_count  = "${var.instance_count}"
  instance_type   = "${var.server_instance_type}"
  subnet_ips      = "${module.networking.subnet_ips}"
  security_group  = "${module.networking.public_sg}"
  publicsubnets   = "${module.networking.public_subnets}"
  privatesubnets  = ["$(module.networking.private_subnets}"]
}
