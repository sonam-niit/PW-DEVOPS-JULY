resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_name

#   force_destroy = true
  tags = {
    Name = "Terraform State Bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}