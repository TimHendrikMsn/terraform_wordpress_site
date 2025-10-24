variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}
variable "env" {
  description = "Environment"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets to associate with the load balancer"
  type        = list(string)
}

variable "security_group_ids" {
  description = "The IDs of the SGs that are used by the load balancer"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC where load_balancer will be created"
  type        = string
}

variable "port_alb" {
  description = "The port for the alb, tg and listener"
  type        = number
}

variable "protocol_alb" {
  description = "The protocol used by the alb, tg and listener"
  type        = string
}

variable "alb_healthcheck_path" {
  description = "Path ALB uses for health checks"
  type        = string
}