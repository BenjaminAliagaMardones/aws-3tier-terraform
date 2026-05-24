variable "environment" {
  description = "Nombre del entorno de despliegue"
  type = string
  default = "dev"
}

variable "vpc_cidr" {
  description = "Rango CIDR para la VPC main"
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Lista de CIDRs para las subnets publicas"
  type = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

variable "private_subnet_cidr" {
  description = "Lista de CIDRs para las subnets privadas"
  type = list(string)
  default = [ "10.0.11.0/24", "10.0.12.0/24" ]
}

variable "database_subnet_cidr" {
  description = "Lista de CIDRs para las subnets de datos"
  type = list(string)
  default = [ "10.0.21.0/24", "10.0.22.0/24" ]
}

