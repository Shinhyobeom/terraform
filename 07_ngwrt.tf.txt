resource "aws_route_table" "hb_ngwrt" {
  vpc_id = aws_vpc.hb_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.hb_ngw.id
  }
  tags = {
    "Name" = "hb-ngwrt"
  }
}