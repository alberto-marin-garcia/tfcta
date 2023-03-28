
## Note we use the account ID to make sure the buckets are unique worldwide
resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.bucket_name}"


}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = var.versioing ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}



resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

## DynamoDB table for locking state in S3
resource "aws_dynamodb_table" "terraform_state_locks" {
  name         = "${var.project}-terraform-state-locks-${var.environment}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

