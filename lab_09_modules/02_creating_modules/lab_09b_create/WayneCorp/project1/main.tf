module "aws_web_vpc" {
  source            = "../modules/aws-web-vpc"
  vpc_cidr_block    = var.vpc_cidr
  subnet_cidr_block = var.subnet_cidr
}


## Note references to outputs of module aws_web_vpc
module "web1" {
  source            = "../modules/aws-web-server-instance"
  os                = var.server_os
  ec2_instance_type = var.ec2_instance_type
  ec2_instance_name = "web-1-${local.name_suffix}"

  vpc_id        = module.aws_web_vpc.vpc_id
  subnet_id     = module.aws_web_vpc.subnet_id
  web_server_sc = module.aws_web_vpc.web_sec_group
}

## Note references to outputs of module aws_web_vpc
module "web2" {
  source            = "../modules/aws-web-server-instance"
  os                = "amazon_linux"
  ec2_instance_name = "web-2-${local.name_suffix}"
  ec2_instance_type = var.ec2_instance_type
  vpc_id            = module.aws_web_vpc.vpc_id
  subnet_id         = module.aws_web_vpc.subnet_id
  web_server_sc     = module.aws_web_vpc.web_sec_group

}