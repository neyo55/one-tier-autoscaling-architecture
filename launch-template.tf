# launch-template.tf

resource "aws_launch_template" "my_autoscale_template" {
  name          = "web_launchtemplate"
  image_id      = "ami-0c1c30571d2dae5c9" # ID of the Amazon Machine Image (AMI) to use for the instance
  instance_type = "t2.micro"
  key_name      = "test-app-key"

  placement {
    availability_zone = "eu-west-1a"
  }

  # network_interfaces {
  #   associate_public_ip_address = true
  # }

  network_interfaces {
    device_index    = 0
    security_groups = [aws_security_group.asg_security_group.id]
  }

  user_data = filebase64("user-data.sh")
  tag_specifications {

    resource_type = "instance"


    tags = {
      Name = "${var.project_name}_server"
    }
  }
}



