# 가용 영역 a의 public subnet
resource "aws_subnet" "hb_puba" {
  vpc_id = aws_vpc.hb_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "hb-puba"
  }
}

resource "aws_subnet" "hb_pubc" {
  vpc_id = aws_vpc.hb_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "hb-pubc"
  }
}

resource "aws_subnet" "hb_pria" {
  vpc_id = aws_vpc.hb_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "hb-pria"
  }
}

resource "aws_subnet" "hb_pric" {
  vpc_id = aws_vpc.hb_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "hb-pric"
  }
}

resource "aws_subnet" "hb_pridba" {
  vpc_id = aws_vpc.hb_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "hb-pridba"
  }
}

resource "aws_subnet" "hb_pridbc" {
  vpc_id = aws_vpc.hb_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "hb-pridbc"
  }
}