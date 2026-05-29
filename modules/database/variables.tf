variable "database_security_group_id" {
  description = "ID del security group de la base de datos"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC main"
  type        = string
}

variable "environment" {
  description = "Nombre del entorno (dev, prod, etc.)"
  type        = string
}

variable "database_subnet_ids" {
  description = "IDs de las subnets donde se despliega la DB (mínimo 2 en AZs distintas)"
  type        = list(string)
}

variable "instance_class" {
  description = "instacia tipo de maquina que maneja de db"
  type        = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  description = "Usuario master de la base de datos"
  type        = string
}