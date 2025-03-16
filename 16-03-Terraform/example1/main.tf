provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami = "ami-08b5b3a93ed654d19" #Linux AMI Id
  instance_type = "t2.micro"

  tags = {
    Name = "sonamvm"
  }
}   

# open this folder in wsl
# execute terraform init
# execute terraform plan
# execute terraform apply