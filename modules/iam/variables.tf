# variables.tf for terraform/modules/iam
variable "role_name" {
  description = "Name of the IAM role for ECS task execution"
  type        = string
}
