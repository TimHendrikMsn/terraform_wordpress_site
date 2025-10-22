resource "aws_launch_template" "launch_template" {
  name                   = var.launch_template_name
  description            = var.launch_template_version_description
  update_default_version = true

  image_id      = var.image_id
  instance_type = var.instance_type

  vpc_security_group_ids = var.vpc_security_group_ids
  iam_instance_profile {
    name = var.instance_profile
  }
  credit_specification {
    cpu_credits = "standard"
  }

  user_data = var.user_data

  tags = { Name = "${var.env}-${var.name_prefix}-launch-template" }

}