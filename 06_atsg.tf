resource "aws_ami_from_instance" "hb_ami" {
  name               = "${var.name}-ami"
  source_instance_id = aws_instance.hb_web.id
  depends_on = [
    aws_instance.hb_web
  ]
}

resource "aws_launch_configuration" "hb_lacf" {
  name                 = "${var.name}-lacf"
  image_id             = aws_ami_from_instance.hb_ami.id
  instance_type        = var.ins_t2m
  iam_instance_profile = var.role #IAM 역할 만든거
  security_groups      = [aws_security_group.hb_sg.id]
  key_name             = var.key
  user_data            = <<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF
}

#배치 그룹
resource "aws_placement_group" "hb_pg" {
  name     = "${var.name}-pg"
  strategy = "cluster"
}
#오토스케일링 그룹
resource "aws_autoscaling_group" "hb_atsg" {
  name                      = "${var.name}-atsg"
  min_size                  = 2
  max_size                  = 8
  health_check_grace_period = 60
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = false
  #placement_group = aws_placement_group.hb_pg.id
  launch_configuration = aws_launch_configuration.hb_lacf.name
  vpc_zone_identifier  = [aws_subnet.hb_pub[0].id, aws_subnet.hb_pub[1].id]
   tag {
    key                 = "Name"
    value               = "${var.name}-web-atsg"
    propagate_at_launch = true
  }

}

resource "aws_autoscaling_attachment" "hb_asatt" {
  autoscaling_group_name = aws_autoscaling_group.hb_atsg.id
  alb_target_group_arn   = aws_lb_target_group.hb_albtg.arn
}
