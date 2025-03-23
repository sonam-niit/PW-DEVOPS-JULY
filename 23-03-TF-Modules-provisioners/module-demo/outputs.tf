output "ec2_public_ip" {
  value = module.web-server.public_ip
}

output "s3_bucket_name" {
  value = module.s3_bucket.bucket_name
}