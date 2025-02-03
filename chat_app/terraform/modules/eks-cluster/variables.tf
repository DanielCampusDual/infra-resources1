variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be created"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for the EKS cluster"
  type        = string
}

variable "eks_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster"
  type        = string
}
