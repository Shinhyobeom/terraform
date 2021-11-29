data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}
# ec2 생성
resource "aws_instance" "hb_web" {
  ami                    = data.aws_ami.amzn.id
  instance_type          = "t2.micro"
  key_name               = "hb-key"
  vpc_security_group_ids = [aws_security_group.hb_sg.id]
  availability_zone      = "ap-northeast-2a"
  private_ip             = "10.0.0.11"
  subnet_id              = aws_subnet.hb_puba.id
  user_data              = file("./install.sh")

  tags = {
    "Name" = "hb-web"
  }
}
# Elastic IP 할당
resource "aws_eip" "hb_web_ip" {
  vpc                       = true
  instance                  = aws_instance.hb_web.id
  associate_with_private_ip = "10.0.0.11"
  depends_on                = [aws_internet_gateway.hb_ig]
}

output "public_ip" {
  value = aws_instance.hb_web.public_ip
}
