variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}
