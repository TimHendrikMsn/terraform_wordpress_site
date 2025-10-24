variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}
variable "env" {
  description = "Environment"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets to associate with the ASG" # pick public ones
  type        = list(string)
}

variable "launch_template_id" {
  description = "The IDs of the LT that is used by the ASG"
  type        = string
}
variable "launch_template_version" {
  description = "Version of the launch template to use for the ASG"
  type        = string
}
variable "alb_target_group" {
  description = "The target group associated with the ASG"
  type        = list(string)
}

variable "capacity_desired" {
  description = "The desired capacity for the ASG"
  type        = number
}
variable "capacity_min" {
  description = "The minimum capacity for the ASG"
  type        = number
}
variable "capacity_max" {
  description = "The maximum capacity for the ASG"
  type        = number
}
