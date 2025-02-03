variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the EKS node group"
  type        = list(string)
}

variable "node_role_arn" {
  description = "The ARN of the IAM role for the EC2 nodes in the EKS cluster"
  type        = string
}