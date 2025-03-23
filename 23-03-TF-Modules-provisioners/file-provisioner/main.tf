
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  key_name = "sonam_new_key"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  tags = {
    Name = "sonamvm"
  }

  provisioner "file" {
    source = "scripts/setup.sh"
    destination = "/tmp/setup.sh"
    
    connection {
       type = "ssh"
       user = "ubuntu"
       private_key = file("sonam_new_key.pem")
       host = self.public_ip
     }
  }
  provisioner "remote-exec" {
    inline = [ 
        "chmod +x /tmp/setup.sh",
        "sudo /tmp/setup.sh"
     ]
     connection {
       type = "ssh"
       user = "ubuntu"
       private_key = file("sonam_new_key.pem")
       host = self.public_ip
     }
  }
}

resource "aws_security_group" "web_sg" {
  name = "web_sg"
  description = "Allow HTTP and SSH"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "null_resource" "sample_destroy" {
  provisioner "local-exec" {
    when = destroy
    command = "echo 'Terraform is getting destroyed'"
  }
}