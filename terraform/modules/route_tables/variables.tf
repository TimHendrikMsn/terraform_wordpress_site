variable "env" {
  description = "Environment"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "rt_suffix" {
  description = "Suffix for the route table name"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the route table will be created"
  type        = string
}

variable "dest_cidr_ipv4" {
  description = "The destination CIDR block for IPv4 traffic"
  type        = string
}
variable "dest_cidr_ipv6" {
  description = "The destination CIDR block for IPv6 traffic"
  type        = string
}

variable "igw_id" {
  description = "The ID of the Internet Gateway to route traffic through"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets to associate with the route table"
  type        = list(string)

}