# output.tf

output "dns" {
  value = aws_lb.my_lb.dns_name
}

