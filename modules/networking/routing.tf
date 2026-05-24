#tabla de ruteo publica
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "${var.environment}-public-rt"
    Environment = var.environment
  }
}

#tabla de ruteo privada
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.environment}-private-rt"
    environment = var.environment
  }
}

#ASOCIACIONES 


#asociar todas las subredes publicas a la tabla publica
resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

#asociar subnets del web tier a la tabla privada
resource "aws_route_table_association" "web" {
  count = length(var.web_subnet_cidr)
  subnet_id = aws_subnet.web[count.index].id
  route_table_id = aws_route_table.private.id
}

#asociar subnets del app tier a la tabla privada
resource "aws_route_table_association" "app" {
  count = length(var.app_subnet_cidr)
  subnet_id = aws_subnet.app[count.index].id
  route_table_id = aws_route_table.private.id
}

#asociacion de las subredes de database a la tabla database
resource "aws_route_table_association" "database" {
  count = length(var.database_subnet_cidr)
  subnet_id = aws_subnet.data[count.index].id
  route_table_id = aws_route_table.private.id
}