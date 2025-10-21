#### General variables ####
variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "eu-central-1"
}
variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "terraform"
}
variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "wp"
}
variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

#### vpc variables ####
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.16.0.0/16"
}

#### subnet variables ####
variable "map_public_ip_on_launch" {
  description = "Whether to map public IP on launch"
  type        = bool
  default     = false
}

#### security group variables ####
