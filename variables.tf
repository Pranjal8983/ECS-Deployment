# variables.tf for terraform
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "my-app-repo"
}

variable "iam_role_name" {
  description = "Name of the IAM role for ECS task execution"
  type        = string
  default     = "ecsTaskExecutionRole"
}

variable "alb_ports" {
  description = "List of ports to open for ALB"
  type        = list(number)
  default     = [80]
}

variable "ecs_ports" {
  description = "List of ports to open for ECS tasks"
  type        = list(number)
  default     = [8080]
}

variable "target_group_name" {
  description = "Name of the ALB target group"
  type        = string
  default     = "ecs-target-group"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "my-cluster"
}
