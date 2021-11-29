resource "aws_route_table" "hb_rt" {
  vpc_id = aws_vpc.hb_vpc.id
  
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.hb_ig.id
  }
  tags = {
      "Name" = "hb-rt"
  }
}