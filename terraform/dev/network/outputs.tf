##### VPC Outputs ####
output "vpc_id" {
  description = "VPC id."
  value       = module.vpc.vpc_id
}

#### IGW Outputs ####
output "igw_id" {
  description = "Internet Gateway id."
  value       = module.igw.igw_id
}

#### Security Groups Outputs ####
output "sg_entrypoint_id" {
  description = "Entry Point Security Group id."
  value       = module.sg_entrypoint.sg_id
}
output "sg_database_id" {
  description = "Database Security Group id." 
  value       = module.sg_database.sg_id
}

#### Subnet Outputs ####

output "pub_a_id" {
  description = "Public Subnet A id."
  value       = module.subnet_pub_a.subnet_id
}
output "pub_b_id" {
  description = "Public Subnet B id."
  value       = module.subnet_pub_b.subnet_id
}
output "pub_c_id" {
  description = "Public Subnet C id."
  value       = module.subnet_pub_c.subnet_id
}

output "sn_db_a_id" {
  description = "DB Subnet A id."
  value       = module.subnet_db_a.subnet_id
}
output "sn_db_b_id" {
  description = "DB Subnet B id."
  value       = module.subnet_db_b.subnet_id
}
output "sn_db_c_id" {
  description = "DB Subnet C id."
  value       = module.subnet_db_c.subnet_id
}