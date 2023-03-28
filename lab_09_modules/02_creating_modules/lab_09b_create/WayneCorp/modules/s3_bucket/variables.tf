variable bucket_name {
  type = string
  description = "Bucket name - must be globally unique"
}
variable "versioning" {
  description = "Enable versioning."
  type        = boolean
  default     = false
}

