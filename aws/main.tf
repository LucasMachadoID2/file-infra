
provider "aws" {
  region = "us-east-1"
}

# ------------------------
# S3 BUCKET
# ------------------------
resource "random_string" "bucket_suffix" {
  length  = 6
  lower   = true
  upper   = false
  numeric = true
  special = false
}

resource "aws_s3_bucket" "video_frames" {
  bucket = "file-process-bucket-fiap"
  force_destroy = true
}
