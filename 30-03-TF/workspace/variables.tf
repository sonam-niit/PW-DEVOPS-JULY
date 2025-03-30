variable "environment" {
  description = "Environment Name"
}
variable "region" {
  description = "Region"
  default = "us-east-1"
}
variable "type" {
  description = "Instance Type"
  default = "t2.micro"
}