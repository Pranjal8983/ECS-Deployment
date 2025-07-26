# main.tf for terraform/modules/security_group
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

resource "aws_security_group" "alb_sg" {
  name   = "alb_sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.alb_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource_group" "ecs_sg" {
  name   = "ecs_sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ecs_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "ecs_sg_id" {
  value = aws_security_group.ecs_sg.id
}
