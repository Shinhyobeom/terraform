#DB생성
resource "aws_db_instance" "hb_mydb" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = var.mysql
  engine_version         = "8.0"
  instance_class         = "db.${var.ins_t2m}"
  name                   = "hb"
  identifier             = "hb"
  username               = "admin"
  password               = "1q2w3e4r"
  parameter_group_name   = "default.mysql8.0"
  availability_zone      = "${var.region}${var.ava_zone[0]}"
  db_subnet_group_name   = aws_db_subnet_group.hb_dbsg.id
  vpc_security_group_ids = [aws_security_group.hb_sg.id]
  skip_final_snapshot    = true
  tags = {
    "Name" = "${var.name}-db"
  }
}
#DB서브넷 그룹
resource "aws_db_subnet_group" "hb_dbsg" {
  name       = "${var.name}-dbsg"
  subnet_ids = [aws_subnet.hb_pridb[0].id, aws_subnet.hb_pridb[1].id]
}
