## AWS Specific parameters

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "profile" {
  type    = string
  default = "cta"
}

variable "lab_number" {
  type = string
}


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


variable "num_azs" {
  type        = number
  description = "Number of AZs to distribute instances"
  default     = 2
  validation {
    condition     = var.num_azs >= 1 && var.num_azs <= 3
    error_message = "Invalid number of AZs to distribute instances"
  }
}

variable "instance_type" {
  type = map

  default = {
    dev     = "t2.micro"
    prod    = "t3.micro"
  }
}

variable "num_instances" {
  type = map

  default = {
    dev     = 1
    prod    = 2
  }
}