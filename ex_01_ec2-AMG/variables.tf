## AWS Specific parameters

variable "region1" {
  type    = string
  default = "eu-west-1"
}

## Region 2 eg for disaster recovery
variable "region2" {
  type    = string
  default = "eu-central-1"
}

variable "profile" {
  type    = string
  default = "cta"
}

## Environment and Project
variable "company" {
  type        = string
  description = "company name - will be used in tags"
  default     = "acme"
}

variable "environment" {
  type        = string
  description = "e.g. test dev prod"
  default     = "dev"
}

variable "project" {
  type    = string
  default = "proj99"
}

variable "lab_number" {
  type    = string
  default = "ex_01_ec2_AMG"
}

## VPC parameters
variable "vpc_cidr" {
  type    = string
  default = "10.99.0.0/16"
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr)) ## Needs work
    error_message = "Invalid CIDR for VPC."
  }
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
  # default = ["2.37.1.5/32", "8.2.0.0/16"]
}

## ECS Parameters
variable "special_port" {
  type        = string
  description = "TCP port where Foobar application listens"
}


