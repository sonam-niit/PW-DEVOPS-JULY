provider "aws" {
  region = var.region
}

resource "aws_instance" "app_server" {
  ami = "ami-084568db4383264d4"
  instance_type = var.type

  tags = {
    Name = "AppServer-${var.environment}"
    Environment = var.environment
  }
}