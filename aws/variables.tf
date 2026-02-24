variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string
  default     = "file-process-bucket"
}

variable "region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "lab_role_arn" {
  description = "ARN da role existente no AWS Academy"
  type        = string
  default     = "arn:aws:iam::{ID_CONTA}:role/LabRole"
}
