module "vpc" {
  source  = "./terraform/modules/vpc"
  vpc_id  = var.vpc_id
}

module "ecr" {
  source = "./terraform/modules/ecr"
}

module "alb" {
  source            = "./terraform/modules/alb"
  vpc_id            = module.vpc.vpc_id  
  subnet_ids        = module.vpc.subnet_ids  
  security_group_id = module.vpc.security_group_id  
}

module "iam_roles" {
  source = "./terraform/modules/iam-roles"
}

module "eks_cluster" {
  source            = "./terraform/modules/eks-cluster"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.subnet_ids
  security_group_id = module.vpc.security_group_id 
  eks_role_arn      = module.iam_roles.eks_role_arn
}

module "eks_node_group" {
  source            = "./terraform/modules/eks-node-group"
  cluster_name      = module.eks_cluster.eks_cluster_name
  subnet_ids        = module.vpc.subnet_ids
  node_role_arn     = module.iam_roles.node_role_arn
}