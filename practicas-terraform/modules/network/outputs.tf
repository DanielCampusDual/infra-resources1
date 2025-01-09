output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "db_subnet_group_id" {
  value = aws_db_subnet_group.main_db_subnet_group.id
}
