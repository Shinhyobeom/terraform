#EIP 만들기
resource "aws_eip" "hb_ngw_ip" {
  vpc = true
}
# NAT게이트웨이 만들기
resource "aws_nat_gateway" "hb_ngw" {
  allocation_id = aws_eip.hb_ngw_ip.id
  subnet_id = aws_subnet.hb_puba.id
  tags = {
    "Name" = "hb-ngw"
  }
}