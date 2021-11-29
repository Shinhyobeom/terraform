resource "aws_launch_configuration" "hb_lacf" {
  name = "hb-lacf"
  image_id = aws_ami_from_instance.hb_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin_role"    #IAM 역할 만든거
  security_groups = [aws_security_group.hb_sg.id]
  key_name = "hb-key"
  user_data =<<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF
}