resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-3a"
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-3b"
}

resource "aws_db_subnet_group" "main_db_subnet_group" {
  name        = "main-db-subnet-group"
  description = "Main DB Subnet Group for RDS instances"
  subnet_ids  = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]
}

terraform {
  backend "s3" {
    bucket = "my-unique-s3-bucket-8788768978697"
    key = "compute/terraform.tfstate"
    region = "eu-west-3"
  }
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "db_subnet_group_id" {
  value = aws_db_subnet_group.main_db_subnet_group.id
}
