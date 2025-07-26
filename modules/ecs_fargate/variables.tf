# variables.tf for terraform/modules/ecs_fargate
variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "container_image" {
  description = "Container image URL"
  type        = string
}

variable "task_execution_role" {
  description = "IAM role ARN for ECS task execution"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN of the target group"
  type        = string
}
