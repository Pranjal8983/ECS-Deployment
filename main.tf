# main.tf for terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

module "ecr" {
  source          = "./modules/ecr"
  repository_name = var.ecr_repository_name
}

module "iam" {
  source    = "./modules/iam"
  role_name = var.iam_role_name
}

module "security_group" {
  source    = "./modules/security_group"
  vpc_id    = module.vpc.vpc_id
  alb_ports = var.alb_ports
  ecs_ports = var.ecs_ports
}

module "alb" {
  source             = "./modules/alb"
  vpc_id             = module.vpc.vpc_id
  public_subnets     = module.vpc.public_subnets
  security_group_ids = [module.security_group.alb_sg_id]
  target_group_name  = var.target_group_name
}

module "ecs_fargate" {
  source              = "./modules/ecs_fargate"
  cluster_name        = var.ecs_cluster_name
  container_image     = module.ecr.repository_url
  task_execution_role = module.iam.execution_role_arn
  security_group_ids  = [module.security_group.ecs_sg_id]
  subnets             = module.vpc.private_subnets
  target_group_arn    = module.alb.target_group_arn
}
