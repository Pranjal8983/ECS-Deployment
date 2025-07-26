# outputs.tf for terraform
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "repository_url" {
  value = module.ecr.repository_url
}

output "execution_role_arn" {
  value = module.iam.execution_role_arn
}

output "alb_sg_id" {
  value = module.security_group.alb_sg_id
}

output "ecs_sg_id" {
  value = module.security_group.ecs_sg_id
}

output "target_group_arn" {
  value = module.alb.target_group_arn
}
