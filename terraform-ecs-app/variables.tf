variable "provider_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "environment" {
  description = "The environment (dev, prod, etc.)"
  type        = string
}

variable "docker_image" {
  description = "The Docker image to use in ECS task"
  type        = string
}

variable "ecr_repo_url" {
  description = "The URL of the existing ECR repository"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the existing VPC"
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