## Environment and Project
variable "environment" {
  type        = string
  description = "e.g. test dev prod"
  default     = "dev"
}

variable "project" {
  description = "Project Name"
  type        = string
}

## AWS Specific parameters
variable "region" {
  description = "AWS Region"
  type        = string
}

variable "profile" {
  description = "AWS CLI profile to be used by Terraform when performing API calls"
  type        = string
}

## EC2 Instance Parameters
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

## Security Groups
variable "sec_allowed_external" {
  description = "CIDRs from which access is allowed"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

