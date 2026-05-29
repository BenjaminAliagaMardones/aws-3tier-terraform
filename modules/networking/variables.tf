variable "environment" {
  description = "Nombre del entorno de despliegue"
  type        = string
}

variable "vpc_cidr" {
  description = "Rango CIDR para la VPC main"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Lista de CIDRs para las subnets publicas"
  type        = list(string)
}

variable "web_subnet_cidr" {
  description = "Lista de CIDRs para las subnets del web tier"
  type        = list(string)
}

variable "app_subnet_cidr" {
  description = "Lista de CIDRs para las subnets del app tier"
  type        = list(string)
}

variable "database_subnet_cidr" {
  description = "Lista de CIDRs para las subnets de datos"
  type        = list(string)
}

