output "instance_public_ip" {
  description = "The Public IP of the Web Server"
  value       = aws_instance.web.public_ip
}

output "instance_public_dns" {
  description = "The Public DNS of the Web Server"
  value       = aws_instance.web.public_dns
}

output "instance_id" {
  description = "The ID of EC2Instance"
  value       = aws_instance.web.id
}