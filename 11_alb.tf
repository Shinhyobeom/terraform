resource "aws_lb" "hb_alb" {
  name = "hb-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.hb_sg.id]
  subnets = [aws_subnet.hb_puba.id,aws_subnet.hb_pubc.id]
  tags = {
    "Name" = "hb-alb"
  }
}

output "dns_name" {
  value = aws_lb.hb_alb.dns_name
}