resource "aws_route_table_association" "hb_ngwass_pria" {
  subnet_id = aws_subnet.hb_pria.id
  route_table_id = aws_route_table.hb_ngwrt.id
}

resource "aws_route_table_association" "hb_ngwass_pric" {
  subnet_id = aws_subnet.hb_pric.id
  route_table_id = aws_route_table.hb_ngwrt.id
}

resource "aws_route_table_association" "hb_ngwass_pridba" {
  subnet_id = aws_subnet.hb_pridba.id
  route_table_id = aws_route_table.hb_ngwrt.id
}

resource "aws_route_table_association" "hb_ngwass_pridbc" {
  subnet_id = aws_subnet.hb_pridbc.id
  route_table_id = aws_route_table.hb_ngwrt.id
}