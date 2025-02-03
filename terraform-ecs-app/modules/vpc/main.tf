# Get the existing VPC based on the VPC ID
data "aws_vpc" "existing_vpc" {
  id = var.vpc_id  # Use the vpc_id passed as a variable
}

# Query for the existing subnets using tags (assuming you know their names)
data "aws_subnets" "public_subnet_1" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing_vpc.id]
  }
  tags = {
    Name = "default-a"  # Replace with the actual subnet name in your VPC
  }
}

data "aws_subnets" "public_subnet_2" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing_vpc.id]
  }
  tags = {
    Name = "default-c"  # Replace with the actual subnet name in your VPC
  }
}

# Security group for ECS instances, use the existing VPC for this security group
resource "aws_security_group" "ec2_sg" {
  vpc_id = data.aws_vpc.existing_vpc.id  # Reference the existing VPC

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic on port 8080 from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }

  tags = {
    Name = "security-group-wordpress-dad"
  }
}
