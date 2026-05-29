resource "aws_db_subnet_group" "this" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.database_subnet_ids

  tags = {
    Name        = "${var.environment}-db-subnet-group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "this" {
  identifier            = "${var.environment}-postgres-db"
  allocated_storage     = 10
  max_allocated_storage = 50
  engine                = "postgres"
  engine_version        = "15.4"
  instance_class        = var.instance_class
  storage_encrypted     = true

  db_name                     = var.db_name
  username                    = var.db_username
  manage_master_user_password = true

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [var.database_security_group_id]

  multi_az            = true
  publicly_accessible = false
  skip_final_snapshot = true
}