resource "aws_ami_from_instance" "hb_ami" {
  name = "hb-ami"
  source_instance_id = aws_instance.hb_web.id
  depends_on = [
    aws_instance.hb_web
  ]
}