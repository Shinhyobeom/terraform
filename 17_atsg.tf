#배치 그룹
resource "aws_placement_group" "hb_pg" {
  name = "hb-pg"
  strategy = "cluster"
}
#오토스케일링 그룹
resource "aws_autoscaling_group" "hb_atsg" {
  name = "hb-atsg"
  min_size = 2
  max_size = 8
  health_check_grace_period = 60
  health_check_type = "EC2"
  desired_capacity = 2
  force_delete = false
  #placement_group = aws_placement_group.hb_pg.id
  launch_configuration = aws_launch_configuration.hb_lacf.name
  vpc_zone_identifier = [aws_subnet.hb_puba.id,aws_subnet.hb_pubc.id]
}