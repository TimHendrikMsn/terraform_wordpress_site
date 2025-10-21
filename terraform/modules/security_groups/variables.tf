variable "env" {
  description = "Environment"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "sg_suffix" {
  description = "Suffix for security groups"
  type = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "name" {
  description = "Name of the security group"
  type        = string  
}
variable "description" {
  description = "Description of the security group"
  type        = string  
}
variable "ingress_description" {
  description = "Description for the ingress rule"
  type        = string
}
variable "ingress_from_port" {    
  description = "Starting port for ingress rule"
  type        = number
}
variable "ingress_to_port" {    
  description = "Ending port for ingress rule"
  type        = number
}
variable "ingress_protocol" {    
  description = "Protocol for ingress rule"
  type        = string
}
variable "ingress_cidr_blocks" {    
  description = "CIDR blocks for ingress rule"
  type        = list(string)
  default     = []
}
variable "ingress_security_groups" {    
  description = "Security groups for ingress rule"
  type        = list(string)
  default     = []
}

variable "egress_from_port" {
  description = "Starting port for egress rule"
  type        = number
}
variable "egress_to_port" {
  description = "Ending port for egress rule"
  type        = number
}
variable "egress_protocol" {
  description = "Protocol for egress rule"
  type        = string
}
variable "egress_cidr_blocks" {   
  description = "CIDR blocks for egress rule"
  type        = list(string)
  default     = []
}
variable "egress_ipv6_cidr_blocks" {   
  description = "IPv6 CIDR blocks for egress rule"
  type        = list(string)
  default     = []
}