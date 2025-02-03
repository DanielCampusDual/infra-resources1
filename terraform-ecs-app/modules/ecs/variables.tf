variable "environment" {
  type        = string
  description = "The environment (dev, prod, etc.)"
}

variable "docker_image" {
  type        = string
  description = "The Docker image to use in ECS task"
}

variable "ecr_repo_url" {
  type        = string
  description = "The URL of the existing ECR repository"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "subnet_ids" {
  description = "List of subnet IDs for ECS service"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for ECS tasks"
  type        = string
}

variable "container_insight_status" {
  description = "Container Insights status (enabled or disabled)"
  type        = object({
    disable = bool
  })
  default = {
    disable = false  
  }
}