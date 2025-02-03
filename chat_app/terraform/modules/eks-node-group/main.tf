resource "aws_eks_node_group" "main" {
  cluster_name    = var.cluster_name
  node_group_name = "chat-app-node-group-dad"
  node_role_arn   = var.node_role_arn  
  subnet_ids      = var.subnet_ids
  instance_types  = ["t3.small"]  

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  tags = {
    Name = "chat-app-node-group-dad"
  }
}