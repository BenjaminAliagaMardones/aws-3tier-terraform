resource "aws_security_group" "web" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    
  }
}