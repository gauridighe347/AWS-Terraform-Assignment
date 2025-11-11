# EC2 Instance
resource "aws_instance" "my_instance" {
  ami                         = "ami-087d1c9a513324697"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  key_name                    = "mykey-pair"
  associate_public_ip_address = true
  user_data = <<-EOF
#!/bin/bash
apt update -y
apt install nginx -y
systemctl enable nginx
systemctl start nginx
echo "<h1>Welcome Gauri! Terraform deployment successful 🚀</h1>" > /var/www/html/index.nginx-debian.html
EOF

  tags = {
    Name = "Ubuntu-Nginx-Server"
  }
}
