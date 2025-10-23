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
  type        = string
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
  description = "Egress from port"
  type        = number
  default     = 0
}
variable "egress_to_port" {
  description = "Egress to port"
  type        = number
  default     = 0
}
variable "egress_protocol" {
  description = "Egress protocol"
  type        = string
  default     = "-1"
}
variable "egress_cidr_blocks" {
  description = "Egress CIDR blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "egress_ipv6_cidr_blocks" {
  description = "Egress IPv6 CIDR blocks"
  type        = list(string)
  default     = ["::/0"]
} 