# outputs.tf for terraform/modules/vpc
output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = []
}

output "private_subnets" {
  value = []
}
