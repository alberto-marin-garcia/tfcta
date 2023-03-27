variable "ec2_instance_name" {
  type    = string
  default = "web_server_instance"
}

variable "ec2_instance_type" {
  description = "Instance type for web server EC2 instance"
  type        = string
  default     = "t2.micro"
}


variable "vpc_id" {
  type = string
  default = null
}

variable "subnet_id" {
  type = string
  default = null
}

variable "web_server_sc" {
  type = string
  default = null
}

variable "os" {
  description = "ubuntu or amazon_linux"
  validation {
    condition     = contains(["ubuntu", "amazon_linux"], var.os)
    error_message = "Valid values for os: unbuntu or amazon_linux."
  } 
  default = "ubuntu"
}