# main.tf for terraform/modules/iam
variable "role_name" {
  description = "Name of the IAM role for ECS task execution"
  type        = string
}

resource "aws_iam_role" "ecs_task_execution" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

output "execution_role_arn" {
  value = aws_iam_role.ecs_task_execution.arn
}
