provider "aws" {
  region = var.provider_region
}

module "vpc" {
  source  = "./modules/vpc"
  vpc_id  = var.vpc_id
}

module "ecs" {
  source                = "./modules/ecs"
  environment           = var.environment
  docker_image          = var.docker_image
  ecr_repo_url          = var.ecr_repo_url
  vpc_id                = module.vpc.vpc_id
  container_insight_status = var.container_insight_status
  subnet_ids            = module.vpc.subnet_ids  
  security_group_id     = module.vpc.security_group_id  
}