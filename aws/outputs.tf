output "bucket_name" {
  value = aws_s3_bucket.video_frames.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.video_frames.arn
}
