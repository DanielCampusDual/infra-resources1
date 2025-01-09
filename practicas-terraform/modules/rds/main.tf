resource "aws_db_instance" "default" {
  allocated_storage = 18
  db_name          = "mydb"
  engine           = "mysql"
  engine_version   = "8.0"
  instance_class   = "db.t3.micro"
  username         = "foo"
  password         = "foobarbz"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = var.db_subnet_group_id
  multi_az             = true
  publicly_accessible  = false
}

resource "aws_db_instance" "read_replica" {
  allocated_storage       = 18
  db_name                = "mydb_replica"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "foo"
  password               = "foobarbz"
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  db_subnet_group_name   = var.db_subnet_group_id
  replicate_source_db    = aws_db_instance.default.id
  publicly_accessible    = false
}

output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "rds_read_replica_endpoint" {
  value = aws_db_instance.read_replica.endpoint
}
