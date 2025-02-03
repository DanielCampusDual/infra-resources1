data "aws_vpc" "existing_vpc" {
  id = var.vpc_id  
}

data "aws_subnets" "public_subnet_1" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing_vpc.id]
  }
  tags = {
    Name = "default-a"  
  }
}

data "aws_subnets" "public_subnet_2" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing_vpc.id]
  }
  tags = {
    Name = "default-c"  
  }
}

resource "aws_security_group" "security_group" {
  vpc_id = data.aws_vpc.existing_vpc.id  

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

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  
    cidr_blocks = ["0.0.0.0/0"]  
  }

  tags = {
    Name = "security-group-wordpress-dad"
  }
}