data "aws_availability_zones" "available" {
  state = "available"
}

#subnet web
resource "aws_subnet" "public" {

  count = length(var.public_subnet_cidr)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-public-subnet-${count.index + 1}"
    environment = var.environment
  }
}

#subnet app
resource "aws_subnet" "private" {

  count = length(var.private_subnet_cidr)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.environment}-private-subnet-${count.index + 1}"
    environment = var.environment
  }
}

#subnet data
resource "aws_subnet" "data" {

  count = length(var.database_subnet_cidr)
  vpc_id = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.environment}-data-subnet-${count.index + 1}"
    environment = var.environment
  }
}