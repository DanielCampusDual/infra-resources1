output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "rds_read_replica_endpoint" {
  value = aws_db_instance.read_replica.endpoint
}
