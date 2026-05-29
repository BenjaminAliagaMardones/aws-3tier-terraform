output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_db_ids" {
  value = aws_subnet.data[*].id
}