# alb.tf

# resource to create application load balancer
resource "aws_lb" "my_lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

  tags = {
    Name = "${var.project_name}_alb"
  }
}

# resource to create a target group
resource "aws_lb_target_group" "target_group" {
  name     = var.tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
  health_check {
    enabled             = true
    healthy_threshold   = 5
    unhealthy_threshold = 5
    timeout             = 60
    matcher             = 200
    interval            = 300
    path                = "/"
  }
}

# resource to create alb listener
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}




































































