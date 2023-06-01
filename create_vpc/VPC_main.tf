provider "aws" {
  region = var.region
  
}
resource "aws_instance" "demo_instance" {
  ami           = var.instance_amis
  instance_type = var.instance_type
  tags = {
    Name = "demo_instance"
  }
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  subnet_id              = aws_subnet.demo_subnet.id
  
} 

resource "aws_vpc" "demo_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "demo_vpc"
  }
}

resource "aws_subnet" "demo_subnet" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = var.subnet_cidr_block

  tags = {
    Name = "demo_subnet"
  }

}
resource "aws_internet_gateway" "demo_gw" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "demo_gw"  
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.demo_gw.id
  }

  tags = {
    Name = "demo_route_table"
  }
}
resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.demo_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = var.sg_protocol
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "demo_sg"
  }
}