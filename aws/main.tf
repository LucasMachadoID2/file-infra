
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

# ------------------------
# BLOQUEIO DE ACESSO PÚBLICO
# ------------------------
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.video_frames.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# ------------------------
# BUCKET POLICY (ROLE EXISTENTE)
# ------------------------
resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.video_frames.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = [
          "s3:GetObject"
        ]
        Resource = "${aws_s3_bucket.video_frames.arn}/*"
      }
    ]
  })
}
