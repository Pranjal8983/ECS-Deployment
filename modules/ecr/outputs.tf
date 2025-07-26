# outputs.tf for terraform/modules/ecr
output "repository_url" {
  value = aws_ecr_repository.main.repository_url
}
