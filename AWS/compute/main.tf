#-------compute/main.tf-------

data "aws_ami" "server_ami" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"]
  }
}


data "template_file" "user-init" {
  count    = 2
  template = "${file("${path.module}/userdata.tpl")}"

  vars {
    firewall_subnets = "${element(var.subnet_ips, count.index)}"
  }
}

resource "aws_instance" "webserver" {
  count         = "${var.instance_count}"
  instance_type = "${var.instance_type}"
  ami           = "${data.aws_ami.server_ami.id}"

  tags = {
    Name = "webserver-${count.index + 1}"
  }

  key_name               = "NewStart"
  vpc_security_group_ids = ["${var.security_group}"]
  subnet_id              = "${element(var.publicsubnets, count.index)}"
  user_data              = "${data.template_file.user-init.*.rendered[count.index]}"
}

resource "aws_instance" "appserver" {
  count         = "${var.instance_count}"
  instance_type = "${var.instance_type}"
  ami           = "${data.aws_ami.server_ami.id}"

  tags = {
    Name = "appserver-${count.index + 1}"
  }

  key_name               = "NewStart"
  vpc_security_group_ids = ["${var.security_group}"]
  subnet_id              = "${element(var.privatesubnets, count.index)}"
}

