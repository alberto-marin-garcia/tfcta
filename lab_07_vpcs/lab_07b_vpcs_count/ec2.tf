
## Create instance - will use defaults for parameters not specified (e.g. VPC, security group)
resource "aws_instance" "server" {

  for_each      = toset(data.aws_subnets.public.ids)
  ami           = data.aws_ami.amazon_linux2_kernel_5.id
  instance_type = var.instance_type
  subnet_id     = each.value

  tags = {
    Name = "vm-${local.name_suffix}-1"
  }
}