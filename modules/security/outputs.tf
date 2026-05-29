output "database_security_group_id" {
  description = "ID del security group de la base de datos"
  value       = aws_security_group.database.id
}
