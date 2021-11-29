resource "aws_lb" "hb_alb" {
  name = "${var.name}-alb"
  internal = false
  load_balancer_type = var.lb_api
  security_groups = [aws_security_group.hb_sg.id]
  subnets = [aws_subnet.hb_pub[0].id,aws_subnet.hb_pub[1].id]
  tags = {
    "Name" = "${var.name}-alb"
  }
}

output "dns_name" {
  value = aws_lb.hb_alb.dns_name
}

resource "aws_lb_target_group" "hb_albtg" {
  name     = "${var.name}-albtg"
  port     = var.port_http
  protocol = var.pro_http
  vpc_id   = aws_vpc.hb_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/health.html"
    port                = var.port_traf
    protocol            = var.pro_http
    timeout             = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "hb_alblis" {
  load_balancer_arn = aws_lb.hb_alb.arn
  port              = var.port_http
  protocol          = var.pro_http

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hb_albtg.arn
  }
}
