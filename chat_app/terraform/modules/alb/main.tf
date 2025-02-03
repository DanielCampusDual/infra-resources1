# ALB creation
resource "aws_lb" "app_alb" {
  name               = "app-alb-dad"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]  
  subnets            = var.subnet_ids  
  enable_deletion_protection = false

  tags = {
    Name = "app-alb-dad"
  }
}

# ALB Target Group
resource "aws_lb_target_group" "app_target_group" {
  name     = "app-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path = "/"
    interval = 30
    timeout  = 5
  }

  tags = {
    Name = "app-target-group-dad"
  }
}

# ALB Listener
resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.app_target_group.arn
    type             = "forward"
  }
}
