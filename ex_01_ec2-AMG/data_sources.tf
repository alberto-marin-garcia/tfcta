data "aws_availability_zones" "available_zones" {
  state = "available"
}

## Filter based on ubuntu web article
# https://ubuntu.com/tutorials/search-and-launch-ubuntu-22-04-in-aws-using-cli

data "aws_ami" "ubuntu_22_04_r1" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230303"]
  }

# https://cloud-images.ubuntu.com/locator/ec2/
# ami-0f9ae27ecf629cbe3

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

data "aws_ami" "ubuntu_22_04_r2" {
  provider = aws.region2
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230303"]
  }

  #ami-050096f31d010b533

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

## Data sources to identify the default vpc and its subnets
## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
data "aws_vpc" "def_vpc_r1" {
  default = true
}

data "aws_vpc" "def_vpc_r2" {
  provider = aws.region2
  default = true
}

# Subnet data source
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet
# data "aws_subnets" "def_vpc_subnets_r1" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.def_vpc_r1.id]
#   }
# }

# data "aws_subnets" "def_vpc_subnets_r2" {
#   provider = aws.region2
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.def_vpc_r2.id]
#   }
# }

data "aws_availability_zones" "azs_available_r1" {
  state = "available"
}

data "aws_availability_zones" "azs_available_r2" {
  provider = aws.region2
  state = "available"
}

resource "aws_subnet" "sub_r1" {
  cidr_block = "172.31.48.0/20"
  vpc_id = data.aws_vpc.def_vpc_r1.id
  availability_zone = data.aws_availability_zones.azs_available_r1.names[1]

  tags = {
    Name = "second"
  }  
}

resource "aws_subnet" "sub_r2" {
  provider = aws.region2
  cidr_block = "172.31.48.0/20"
  vpc_id = data.aws_vpc.def_vpc_r2.id
  availability_zone = data.aws_availability_zones.azs_available_r2.names[1]

  tags = {
    Name = "second"
  }  
}
