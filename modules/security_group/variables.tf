# variables.tf for terraform/modules/security_group
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "alb_ports" {
  description = "List of ports to open for ALB"
  type        = list(number)
}

variable "ecs_ports" {
  description = "List of ports to open for ECS tasks"
  type        = list(number)
}
