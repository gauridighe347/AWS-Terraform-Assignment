output "alb_dns_name" {
  description = "Access your Nginx app via this ALB DNS name"
  value       = aws_lb.app_alb.dns_name
}

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_instance.public_ip
}