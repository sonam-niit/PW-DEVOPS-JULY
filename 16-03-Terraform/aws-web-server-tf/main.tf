provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name 
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data = <<-EOF
                    #!/bin/bash
                    apt update
                    apt install -y nginx
                    systemctl enable nginx
                    systemctl start nginx
                    EOF
  tags = {
    Name = "terraform-web-server"
  }
}

# Create Security Group with 2 rules for HTTP and SSH
resource "aws_security_group" "web_sg" {
  name = "web_sg"
  description = "Allow HTTP and SSH"
#   Inbound Rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
#   Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}