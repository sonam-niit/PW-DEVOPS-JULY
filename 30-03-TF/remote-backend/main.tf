provider "aws" {
  region = "us-east-1"
}
resource "random_id" "suffix" {
  byte_length = 4
}
resource "aws_s3_bucket" "tf_state" {
  bucket = "${var.prefix}-${random_id.suffix.hex}"

  tags = {
    Name = "remote backent bucket"
  }
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}