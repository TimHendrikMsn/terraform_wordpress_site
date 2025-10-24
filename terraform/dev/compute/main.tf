module "launch_template" {
  source = "../../modules/launch_template"
  name_prefix                         = var.name_prefix
  env                                 = var.env
  launch_template_name                = "${var.env}-${var.name_prefix}-launch-template"
  launch_template_version_description = var.launch_template_version_description

  instance_type                       = var.instance_type
  image_id                            = data.aws_ssm_parameter.linux_ami.value
  vpc_security_group_ids              = [data.terraform_remote_state.network.outputs.sg_entrypoint_id]
  instance_profile                    = data.terraform_remote_state.iam.outputs.wordpress_instance_profile
  user_data = base64encode(templatefile("${path.module}/user_data.sh", {
    ENV         = var.env
    NAME_PREFIX = var.name_prefix
    REGION      = var.aws_region
  }))
}

module "asg" {
  source = "../../modules/auto_scaling_group"
  name_prefix                         = var.name_prefix
  env                                 = var.env

  subnet_ids = [
    data.terraform_remote_state.network.outputs.pub_a_id,
    data.terraform_remote_state.network.outputs.pub_b_id,
    data.terraform_remote_state.network.outputs.pub_c_id,
  ]

  alb_target_group = [data.terraform_remote_state.network.outputs.alb_tg_arn]
  capacity_desired = 1
  capacity_min = 1
  capacity_max = 3
  
  launch_template_id      = module.launch_template.launch_template_id
  launch_template_version = module.launch_template.launch_template_latest_version
}
