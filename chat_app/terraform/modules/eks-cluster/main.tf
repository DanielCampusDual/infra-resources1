resource "aws_eks_cluster" "main" {
  name     = "chat-app-cluster-dad"
  role_arn = var.eks_role_arn  
  vpc_config {
    subnet_ids = var.subnet_ids  
    security_group_ids = [var.security_group_id]  
  }

  tags = {
    Name = "chat-app-cluster-dad"
  }
}