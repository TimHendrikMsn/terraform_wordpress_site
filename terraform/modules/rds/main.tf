resource "aws_db_subnet_group" "subnet_group" {
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = "${var.env}-${var.name_prefix}-rds-subnet-group"
  }
}

# main.tf
resource "aws_db_instance" "rds" {
  identifier     = var.db_identifier
  engine         = var.db_engine
  engine_version = var.db_engine_version
  instance_class = var.db_instance_class

  # Free tier style sizing
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type

  # Auth
  username = var.ssm_username_param
  password = var.ssm_password_param

  # Networking & placement
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = var.security_groups
  publicly_accessible    = false
  availability_zone      = var.availability_zone
  multi_az               = false

  # DB options
  db_name             = var.ssm_name_param
  deletion_protection = false
  skip_final_snapshot = true


  backup_retention_period = 0



  tags = { Name = "${var.env}-${var.name_prefix}-rds-instance" }
}