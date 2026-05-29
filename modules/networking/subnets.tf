data "aws_availability_zones" "available" {
  state = "available"
}

#subnet public
resource "aws_subnet" "public" {

  count      = length(var.public_subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.environment}-public-subnet-${count.index + 1}"
    environment = var.environment
  }
}

resource "aws_subnet" "web" {

  count      = length(var.web_subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.web_subnet_cidr[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name        = "${var.environment}-web-subnet-${count.index + 1}"
    environment = var.environment
  }
}

#subnet app
resource "aws_subnet" "app" {

  count      = length(var.app_subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.app_subnet_cidr[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name        = "${var.environment}-app-subnet-${count.index + 1}"
    environment = var.environment
  }
}

#subnet data
resource "aws_subnet" "data" {

  count      = length(var.database_subnet_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name        = "${var.environment}-data-subnet-${count.index + 1}"
    environment = var.environment
  }
}