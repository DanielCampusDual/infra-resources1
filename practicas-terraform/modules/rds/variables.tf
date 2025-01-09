variable "vpc_id" {
  description = "ID of the VPC where RDS should be deployed"
  type        = string
}

variable "db_subnet_group_id" {
  description = "ID of the DB Subnet Group"
  type        = string
}
