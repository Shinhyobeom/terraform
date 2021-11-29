resource "aws_route_table_association" "hb_igas_puba" {
  subnet_id = aws_subnet.hb_puba.id
  route_table_id = aws_route_table.hb_rt.id
}

resource "aws_route_table_association" "hb_igas_pubc" {
  subnet_id = aws_subnet.hb_pubc.id
  route_table_id = aws_route_table.hb_rt.id
}