#EIP 만들기
resource "aws_eip" "hb_ngw_ip" {
  vpc = true
}
# NAT게이트웨이 만들기
resource "aws_nat_gateway" "hb_ngw" {
  allocation_id = aws_eip.hb_ngw_ip.id
  subnet_id     = aws_subnet.hb_pub[0].id
  tags = {
    "Name" = "${var.name}-ngw"
  }
}

resource "aws_route_table" "hb_ngwrt" {
  vpc_id = aws_vpc.hb_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_nat_gateway.hb_ngw.id
  }
  tags = {
    "Name" = "${var.name}-ngwrt"
  }
}

resource "aws_route_table_association" "hb_ngwass_pri" {
  count          = 2
  subnet_id      = aws_subnet.hb_pri[count.index].id
  route_table_id = aws_route_table.hb_ngwrt.id
}

resource "aws_route_table_association" "hb_ngwass_pridb" {
  count          = 2
  subnet_id      = aws_subnet.hb_pridb[count.index].id
  route_table_id = aws_route_table.hb_ngwrt.id
}
