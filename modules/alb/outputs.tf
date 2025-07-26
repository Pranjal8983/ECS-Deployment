# outputs.tf for terraform/modules/alb
output "target_group_arn" {
  value = aws_lb_target_group.main.arn
}
