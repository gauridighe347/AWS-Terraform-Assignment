resource "aws_vpc" "my-vpc" {
  cidr_block = "20.0.0.0/16"
  tags = {
    Name = "My-Vpc"
  }
}

resource "aws_subnet" "private_sub" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "20.0.3.0/24"
  tags = {
    Name = "My-Private-Subnet"
  }
}

resource "aws_subnet" "public_sub" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "20.0.4.0/24"
  tags = {
    Name = "My-Public-Subnet"
  }
}

resource "aws_internet_gateway" "my-gateway" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "My-Internet-Gateway"
  }
}

resource "aws_route_table" "Public-Rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-gateway.id
  }
}

resource "aws_route_table_association" "Public" {
  route_table_id = aws_route_table.Public-Rt.id
  subnet_id      = aws_subnet.public_sub.id
}

resource "aws_instance" "my-instance" {
  ami           = "ami-087d1c9a513324697"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_sub.id

  tags = {
    Name = "My-Instance"
  }
}