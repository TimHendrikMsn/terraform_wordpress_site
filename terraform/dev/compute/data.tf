data "terraform_remote_state" "network" {
  backend = "local"
  config  = { path = "../network/terraform.tfstate" }
}

data "terraform_remote_state" "iam" {
  backend = "local"
  config  = { path = "../iam/terraform.tfstate" }
}

data "aws_ssm_parameter" "linux_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}
