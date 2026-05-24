terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "networking" {
  source = "./modules/networking"
  environment = var.environment
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  app_subnet_cidr = var.app_subnet_cidr
  web_subnet_cidr = var.web_subnet_cidr
  database_subnet_cidr = var.database_subnet_cidr
}

module "security" {
  source = "./modules/security"
  vpc_id = module.networking.vpc_id
  environment = var.environment
}