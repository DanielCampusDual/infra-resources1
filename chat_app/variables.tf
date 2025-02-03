variable "vpc_id" {
  description = "The ID of the existing VPC"
  type        = string
}

variable "provider_region" {
  description = "The AWS region to deploy resources"
  type        = string
}