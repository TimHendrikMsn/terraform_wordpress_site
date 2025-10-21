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
#################################################