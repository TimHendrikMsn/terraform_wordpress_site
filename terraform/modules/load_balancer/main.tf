resource "aws_lb" "load_balancer" {
  name               = "${var.env}-${var.name_prefix}-load-balancer"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids
  idle_timeout       = 60

  tags = {
    Environment = "${var.env}-${var.name_prefix}-load-balancer"
  }
}

resource "aws_lb_target_group" "tg" {
  name        = "${var.env}-${var.name_prefix}-target-group"
  port        = var.port_alb
  protocol    = var.protocol_alb
  target_type = "instance"
  vpc_id      = var.vpc_id

  stickiness {
    enabled         = true
    type            = "lb_cookie"
    cookie_duration = 600
  }

  health_check {
    path                = var.alb_healthcheck_path
    protocol            = var.protocol_alb
    matcher             = "200-399"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }
  tags = { Name = "${var.env}-${var.name_prefix}-target-group" }
}


resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = var.port_alb
  protocol          = var.protocol_alb

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_ssm_parameter" "alb_dns_name" {
  name        = "/${var.env}/${var.name_prefix}/ALBDNSName"
  description = "ALB DNS Name"
  type        = "String"
  data_type   = "text"
  tier        = "Standard"

  value = aws_lb.load_balancer.dns_name

  overwrite = true

  tags = {
    Name = "${var.env}-${var.name_prefix}-ssm-alb-dns-name"
  }
}