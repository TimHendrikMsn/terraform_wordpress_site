data "aws_availability_zones" "available" {}

data "terraform_remote_state" "network" {
  backend = "local"
  config  = { path = "../network/terraform.tfstate" }
}

data "aws_ssm_parameter" "db_username" {
  name            = "/${var.env}/${var.name_prefix}/DBUser"
  with_decryption = true
}

data "aws_ssm_parameter" "db_password" {
  name            = "/${var.env}/${var.name_prefix}/DBPassword"
  with_decryption = true
}

data "aws_ssm_parameter" "db_name" {
  name            = "/${var.env}/${var.name_prefix}/DBName"
  with_decryption = true
}



