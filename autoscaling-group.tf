# autoscaling-group.tf

# create autoscaling group
resource "aws_autoscaling_group" "asg" {
  name                = "asg_resource_availability"
  desired_capacity    = 3
  max_size            = 6
  min_size            = 2
  target_group_arns   = [aws_lb_target_group.target_group.arn]
  health_check_type   = "EC2"
  vpc_zone_identifier = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]


  launch_template {
    id      = aws_launch_template.my_autoscale_template.id
    version = aws_launch_template.my_autoscale_template.latest_version
  }
}


