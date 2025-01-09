provider "aws" {
  region = "eu-west-3"
}

# Network module
module "network" {
  source = "./modules/network"
}

# RDS module
module "rds" {
  source             = "./modules/rds"
  vpc_id             = module.network.vpc_id
  db_subnet_group_id = module.network.db_subnet_group_id
}


output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
