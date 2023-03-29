module "s3_bucket" {
  source            = "github.com/alberto-marin-garcia/tfcourse-modules//s3-modules?ref=1.2"
  bucket_name = "${var.lab_number}-${var.bucket_name}"
  versioning = var.versioning
}