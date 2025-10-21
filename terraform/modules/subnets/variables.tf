
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

variable "availability_zone" {
  description = "The availability zone"
  type        = string
}

variable "cidr_subnet" {
  description = "Subnet CIDR blocks"
  type        = string
}

variable "cidr_subnet_ipv6" {
  description = "Subnet IPv6 CIDR blocks"
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IP on launch"
  type        = bool
}

variable "subnet_suffix" {
  description = "Suffix for the subnet name"
  type        = string
}