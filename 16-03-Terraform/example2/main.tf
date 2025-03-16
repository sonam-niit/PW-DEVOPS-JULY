provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server" {
  count = 3
  ami = "ami-04b4f1a9cf54c11d0" #ubuntu AMI Id
  instance_type = "t2.micro"

  tags = {
    Name = "server-${count.index+1}"
  }
}   
