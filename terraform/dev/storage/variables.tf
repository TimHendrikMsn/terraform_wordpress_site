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
  default = "wp"
}
variable "env" {
    description = "Environment"
    type        = string
    default = "dev"
}

#### RDS variables ####

variable "db_engine" {
  description = "Database engine"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
  default     = "8.0.42"
}

variable "db_instance_class" {
  description = "DB instance class (use free-tier micro)"
  type        = string
  default     = "db.t3.micro"
  validation {
    condition     = contains(["db.t2.micro", "db.t3.micro", "db.t4g.micro"], var.db_instance_class)
    error_message = "Instance class must be one of: db.t2.micro, db.t3.micro, db.t4g.micro."
  }
}

variable "allocated_storage" {
  description = "Allocated storage in GB (free tier typically 20GB)"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "Storage type"
  type        = string
  default     = "gp2"
}
