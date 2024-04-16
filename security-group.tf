
# security-groups.tf

# resource to create a security group for load balancer
resource "aws_security_group" "lb_sg" {
  name        = var.lb_sg_name
  description = "Allow inbound TLS traffic for the load balancer"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}_alb_sg"
  }
}

# resource to create autoscaling security group
resource "aws_security_group" "asg_security_group" {
  name        = var.asg_sg_name
  description = "ASG Security Group"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "asg-sg"
  }
}



































