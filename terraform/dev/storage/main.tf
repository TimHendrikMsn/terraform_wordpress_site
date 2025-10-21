module "rds" {
  source = "../../modules/rds"

  name_prefix = var.name_prefix
  env         = var.env

  db_subnet_ids  = [data.terraform_remote_state.network.outputs.sn_db_a_id,
                 data.terraform_remote_state.network.outputs.sn_db_b_id,
                 data.terraform_remote_state.network.outputs.sn_db_c_id]
  availability_zone  = data.aws_availability_zones.available.names[0]

  ssm_username_param  = data.aws_ssm_parameter.db_username.value
  ssm_password_param  = data.aws_ssm_parameter.db_password.value
  ssm_name_param      = data.aws_ssm_parameter.db_name.value

  db_identifier       = "${var.env}wordpressdb"
  db_engine           = var.db_engine
  db_engine_version   = var.db_engine_version

  db_instance_class   = var.db_instance_class
  allocated_storage   = var.allocated_storage
  storage_type        = var.storage_type
}