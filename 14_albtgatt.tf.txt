#타겟그룹 지정
resource "aws_lb_target_group_attachment" "hb_albtgatt" {
  target_group_arn = aws_lb_target_group.hb_albtg.arn
  target_id = aws_instance.hb_web.id
  port = 80
}