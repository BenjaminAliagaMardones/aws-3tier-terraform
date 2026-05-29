#SG del balanceador de carga
resource "aws_security_group" "alb" {
  name        = "${var.environment}-alb-sg"
  description = "acceso publico desde internet"
  vpc_id      = var.vpc_id

  #permitir http
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #permitir https
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #salida libre
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#SG de servidores web tier
resource "aws_security_group" "web" {
  name        = "${var.environment}-web-sg"
  description = "acceso restringido solo desde el ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#SG de servidor app tier
resource "aws_security_group" "app" {
  name        = "${var.environment}-app-sg"
  description = "acceso restringido solo desde el web tier"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }
}
#SG de la database
resource "aws_security_group" "database" {
  name        = "${var.environment}-database-sg"
  description = "accesp restringido solo desde la capa de aplicacion"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.app.id]
  }
}