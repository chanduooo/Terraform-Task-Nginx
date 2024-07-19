resource "aws_vpc" "task-vpc" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "TaskVpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.task-vpc.id
  cidr_block              = var.public-subnet-cidr
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch  = true
  tags = {
    Name = "Public-Subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id                  = aws_vpc.task-vpc.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch  = true
  tags = {
    Name = "Private-subnet"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  vpc_id      = aws_vpc.task-vpc.id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Task-SG"
  }
}