resource "aws_security_group" "security_group" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  ingress {
    description     = var.ingress_description
    from_port       = var.ingress_from_port
    to_port         = var.ingress_to_port
    protocol        = var.ingress_protocol
    cidr_blocks     = var.ingress_cidr_blocks
    security_groups = var.ingress_security_groups
  }

  egress {
    from_port        = var.egress_from_port
    to_port          = var.egress_to_port
    protocol         = var.egress_protocol
    cidr_blocks      = var.egress_cidr_blocks
    ipv6_cidr_blocks = var.egress_ipv6_cidr_blocks
  }

  tags = {
    Name = "${var.env}-${var.name_prefix}-sg-${var.sg_suffix}"
  }
}

