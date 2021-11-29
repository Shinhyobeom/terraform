resource "aws_internet_gateway" "hb_ig" {
  vpc_id = aws_vpc.hb_vpc.id

  tags = {
    "Name" = "${var.name}-ig"
  }
}

resource "aws_route_table" "hb_rt" {
  vpc_id = aws_vpc.hb_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_internet_gateway.hb_ig.id
  }
  tags = {
    "Name" = "${var.name}-rt"
  }
}

resource "aws_route_table_association" "hb_igas_pub" {
  count          = 2
  subnet_id      = aws_subnet.hb_pub[count.index].id
  route_table_id = aws_route_table.hb_rt.id
}