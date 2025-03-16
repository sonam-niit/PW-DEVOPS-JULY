variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}
variable "ami_id" {
  description = "AMI Id for ubuntu"
  type        = string
}
variable "instance_type" {
  description = "EC2 instance Type"
  default     = "t2.micro"
}
variable "key_name" {
  description = "EC2 Key pair Name"
  type        = string
}
