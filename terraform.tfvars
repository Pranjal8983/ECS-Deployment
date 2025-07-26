aws_region           = "us-east-1"
vpc_cidr             = "10.0.0.0/16"
ecr_repository_name  = "my-app-repo"
iam_role_name        = "ecsTaskExecutionRole"
alb_ports            = [80]
ecs_ports            = [8080]
target_group_name    = "ecs-target-group"
ecs_cluster_name     = "my-cluster"
