
resource "aws_instance" "ec2_from_lt" {
  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  subnet_id = var.subnet_id

  tags = { Name = "${var.env}-${var.name_prefix}-instance" }

}