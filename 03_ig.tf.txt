resource "aws_internet_gateway" "hb_ig" {
  vpc_id = aws_vpc.hb_vpc.id
  
  tags = {
    "Name" = "hb-ig"
  }
}