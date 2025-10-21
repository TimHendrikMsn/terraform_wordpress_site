
variable "env" {
  description = "Environment"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created"
  type        = string
}
