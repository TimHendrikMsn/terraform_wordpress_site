
variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}
variable "env" {
    description = "Environment"
    type        = string
}

variable "security_groups" {
  description = "List of security group IDs to attach to the RDS instance"
  type       = list(string)
  default = []
}

variable "db_subnet_ids" {
  description = "List of DB subnet IDs"
  type        = list(string)
}

variable "db_identifier" {
  description = "DB instance identifier"
  type        = string
}

variable "db_engine" {
  description = "Database engine"
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
}

variable "ssm_username_param" {
  description = "SSM Parameter Store name for the master username"
  type        = string
}

variable "ssm_password_param" {
  description = "SSM Parameter Store name for the master password (SecureString)"
  type        = string
}

variable "ssm_name_param" {
  description = "SSM Parameter Store name for the database name"
  type        = string
}

variable "db_instance_class" {
  description = "DB instance class (use free-tier micro)"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage in GB (free tier typically 20GB)"
  type        = number
}

variable "storage_type" {
  description = "Storage type"
  type        = string
}

variable "availability_zone" {
  description = "Single-AZ for the DB instance"
  type        = string
}
