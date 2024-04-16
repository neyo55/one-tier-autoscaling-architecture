# terraform.tfvars

region = "eu-west-1"

project_name = "one_tier_autoscaling"

vpc_cidr_block = "10.0.0.0/16"

public_subnet_1_cidr_block = "10.0.1.0/24"

public_subnet_1_az = "eu-west-1a"

public_subnet_2_cidr_block = "10.0.2.0/24"

public_subnet_2_az = "eu-west-1b"

lb_sg_name = "one-tier-lb-sg"

keypair_name = "test-app-key"

lb_name = "one-tier-autoscaling-alb"

tg_name = "one-tier-autoscaling-tg"

asg_sg_name = "one-tier-autoscaling-sg"















