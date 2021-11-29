resource "aws_autoscaling_attachment" "hb_asatt" {
  autoscaling_group_name = aws_autoscaling_group.hb_atsg.id
  alb_target_group_arn = aws_lb_target_group.hb_albtg.arn
}