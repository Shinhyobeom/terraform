#DB생성
resource "aws_db_instance" "hb_mydb" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t2.micro"
  name = "hb"
  identifier = "hb"
  username = "admin"
  password = "1q2w3e4r"
  parameter_group_name = "default.mysql8.0"
  availability_zone = "ap-northeast-2a"
  db_subnet_group_name = aws_db_subnet_group.hb_dbsg.id
  vpc_security_group_ids = [aws_security_group.hb_sg.id]
  skip_final_snapshot = true
  tags = {
    "Name" = "hb-db"
  }
}
#DB서브넷 그룹
resource "aws_db_subnet_group" "hb_dbsg" {
  name = "hb-dbsg"
  subnet_ids = [aws_subnet.hb_pridba.id,aws_subnet.hb_pridbc.id]
}