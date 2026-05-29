terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "networking" {
  source               = "./modules/networking"
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  app_subnet_cidr      = var.app_subnet_cidr
  web_subnet_cidr      = var.web_subnet_cidr
  database_subnet_cidr = var.database_subnet_cidr
}

module "security" {
  source      = "./modules/security"
  vpc_id      = module.networking.vpc_id
  environment = var.environment
}

module "database" {
  source                     = "./modules/database"
  vpc_id                     = module.networking.vpc_id
  environment                = var.environment
  database_subnet_ids        = module.networking.subnet_db_ids
  database_security_group_id = module.security.database_security_group_id
  instance_class             = var.instance_class
  db_name                    = var.db_name
  db_username                = var.db_username
}