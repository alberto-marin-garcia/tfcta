# Required variable
variable bucket_name {
  type = string
  description = "Bucket name - must be globally unique"
}

## Variable is optional 
variable "versioning" {
  description = "Enable versioning."
  type        = bool
}

## Environment and Project
variable "environment" {
  type        = string
  description = "e.g. test dev prod"
  default     = "dev"
}

variable "company" {
  type    = string
}

variable "project" {
  type = string
}

## AWS Specific parameters
variable "region" {
  type    = string
}

variable "profile" {
  type = string
}

variable "lab_number" {
  type = string
}