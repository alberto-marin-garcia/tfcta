locals {
  server_ami_id = {
    ubuntu = data.aws_ami.ubuntu_22_04.id
    amazon_linux = data.aws_ami.amazon_linux2_kernel_5.id
  }
}

resource "aws_instance" "web_server_instance" {
  ami = local.server_ami_id[var.os]
  instance_type = var.ec2_instance_type

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.web_server_sc]

  tags = {
    Name = var.ec2_instance_name
  }
}

