resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.environment}-cluster-dad2"
  
  setting {
    name  = "containerInsights"
    value = var.container_insight_status.disable ? "disabled" : "enabled"
  }

  tags = {
    Environment = var.environment
    Team        = "Devops-bootcamp"
  }
}

resource "aws_ecs_task_definition" "ecs_task" {
  family                   = "${var.environment}-task-dad2"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = var.docker_image
    image     = "${var.ecr_repo_url}:${var.docker_image}"
    cpu       = 256
    memory    = 512
    essential = true
  }])
}

resource "aws_ecs_service" "ecs_service" {
  name            = "${var.environment}-ecs-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  desired_count   = 1

  network_configuration {
    subnets          = var.subnet_ids  # Use the subnet IDs passed as a variable
    security_groups  = [var.security_group_id]  # Security group passed as a variable
    assign_public_ip = false
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.environment}-ecs-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

resource "aws_iam_role" "ecs_task_role" {
  name = "${var.environment}-ecs-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}
