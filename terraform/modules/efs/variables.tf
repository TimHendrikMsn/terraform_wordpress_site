variable "env" {
  description = "Environment"
  type        = string
}
variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "efs_creation_token" {
  description = "The creation token for the EFS file system."
  type        = string
}
variable "efs_performance_mode" {
  description = "The performance mode for the EFS file system."
  type        = string
}
variable "throughput_mode" {
  description = "The throughput mode for the EFS file system."
  type        = string
}
variable "encryption_bool" {
  description = "Boolean to enable encryption for the EFS file system."
  type        = bool
}
variable "efs_lifecycle_policy_transition_to_ia" {
  description = "The lifecycle policy transition to IA for the EFS file system."
  type        = string
}
variable "subnet_ids" {
  description = "List of subnet IDs where EFS mount targets will be created."
  type        = list(string)
}
variable "efs_security_groups" {
  description = "List of security group IDs to attach to the EFS mount targets."
  type        = list(string)
}