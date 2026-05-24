variable "vpc_id" {
  description = "ID de la VPC donde se crearán los security groups"
  type        = string
}

variable "environment" {
  description = "Nombre del entorno (dev, prod, etc.)"
  type        = string
}
