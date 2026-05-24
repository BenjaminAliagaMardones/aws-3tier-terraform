#elastic IP para la NAT
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  depends_on = [ aws_internet_gateway.gw ]
}

#NAT asociado a la primera subred publica
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public[0].id

  tags = {
    Name = "${var.environment}-nat-gw"
    Environment = var.environment
  }
}
