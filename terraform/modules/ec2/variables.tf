variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}
variable "env" {
  description = "Environment"
  type        = string
}
variable "launch_template_id" {
  description = "ID of the launch template to use for the EC2 instance"
  type        = string
}
variable "launch_template_version" {
  description = "Version of the launch template to use for the EC2 instance"
  type        = string
}
variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string
}