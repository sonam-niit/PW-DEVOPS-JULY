variable "instance_name" {
  type = string
  description = "Name of EC2 Instance"
}

variable "instance_type" {
  type = string
  description = "EC2 Instance type"
}

variable "image_id" {
  type = string
  description = "AMI ID for ubuntu Instance"
}