# main.tf for terraform/modules/vpc
variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = []
}

output "private_subnets" {
  value = []
}
