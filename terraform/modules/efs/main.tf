resource "aws_efs_file_system" "efs" {
  creation_token   = var.efs_creation_token
  performance_mode = var.efs_performance_mode
  throughput_mode  = var.throughput_mode
  encrypted        = var.encryption_bool


  # Lifecycle management
  lifecycle_policy {
    transition_to_ia = var.efs_lifecycle_policy_transition_to_ia
  }

  tags = {
    Name = "${var.env}-${var.name_prefix}-efs"
  }
}


resource "aws_efs_mount_target" "efs_mt" {
  for_each        = toset(var.subnet_ids)
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = each.value
  security_groups = var.efs_security_groups
}


resource "aws_ssm_parameter" "wordpress_efs_endpoint" {
  name        = "/${var.env}/${var.name_prefix}/EFSFSID"
  description = "EFS Files System ID"
  type        = "String"
  data_type   = "text"
  tier        = "Standard"

  value = aws_efs_file_system.efs.id

  overwrite = true

  tags = {
    Name = "${var.env}-${var.name_prefix}-ssm-efs-fs-id"
  }
}



