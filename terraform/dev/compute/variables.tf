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

#### Launch Template Variables ####
variable "launch_template_version_description" {
  description = "Template version description"
  type        = string
  default     = "Template for a WordPress EC2 instance"
}

variable "instance_type" {
  description = "EC2 instance type (free tier eligible t2.micro or t3.micro)"
  type        = string
  default     = "t2.micro"
  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "instance_type must be either t2.micro or t3.micro."
  }
}