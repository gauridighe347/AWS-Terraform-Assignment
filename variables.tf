variable "vpc_cidr" {
  default = "20.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  default = "20.0.4.0/24"
}

variable "public_subnet_2_cidr" {
  default = "20.0.5.0/24"
}

variable "private_subnet_cidr" {
  default = "20.0.3.0/24"
}

variable "aws_region" {
  default = "ap-south-1"
}

variable "key_name" {
  default = "MY-KEY"
}

variable "instance_type" {
  default = "t3.micro"
}