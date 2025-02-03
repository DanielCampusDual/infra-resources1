variable "vpc_id" {
  description = "The ID of the VPC where the ALB will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the ALB"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for the ALB"
  type        = string
}