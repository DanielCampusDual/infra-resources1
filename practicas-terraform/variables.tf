variable "region" {
  description = "AWS region"
  default     = "eu-west-3"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.1.0.0/16" 
}
