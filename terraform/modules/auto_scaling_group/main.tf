resource "aws_autoscaling_group" "asg" {
  name                      = "${var.env}-${var.name_prefix}-asg"
  vpc_zone_identifier       = var.subnet_ids
  desired_capacity          = var.capacity_desired
  min_size                  = var.capacity_min
  max_size                  = var.capacity_max
  target_group_arns         = var.alb_target_group
  health_check_type         = "ELB"
  health_check_grace_period = 120

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  tag {
    key                 = "Name"
    value               = "${var.env}-${var.name_prefix}-asg"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
