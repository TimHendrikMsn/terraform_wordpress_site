variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}
variable "env" {
  description = "Environment"
  type        = string
}

variable "launch_template_name" {
  description = "Launch template name (console step: 'Wordpress')"
  type        = string
}

variable "launch_template_version_description" {
  description = "Template version description"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type (free tier eligible t2.micro or t3.micro)"
  type        = string
}

variable "image_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the instance"
  type        = list(string)
}

variable "instance_profile" {
  description = "IAM instance profile name to attach to the EC2 instance"
  type        = string
}

variable "user_data" {
  description = "User data script to configure the instance on launch"
  type        = string
}