## Create instance - will use defaults for parameters not specified (e.g. VPC, security group)
resource "aws_instance" "server1" {
  ami           = data.aws_ami.ubuntu_22_04_r1.id
  instance_type = var.instance_type

  #subnet_id = data.aws_subnets.def_vpc_subnets_r1.ids[1]
  subnet_id = aws_subnet.subnet_r1.id

  tags = {
    Name = "vm-${local.name_suffix}-1"
  }
}

resource "aws_instance" "server2" {
  provider = aws.region2
  ami           = data.aws_ami.ubuntu_22_04_r2.id
  instance_type = var.instance_type 

  #subnet_id = data.aws_subnets.def_vpc_subnets_r2.ids[1]
  subnet_id = aws_subnet.subnet_r2.id

  tags = {
    Name = "vm-${local.name_suffix}-1"
  }
}
