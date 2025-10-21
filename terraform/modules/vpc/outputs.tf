output "vpc_id" {
  description = "VPC id."
  value       = aws_vpc.main.id
}
output "vpc_cidr_block" {
  description = "VPC CIDR block."
  value       = aws_vpc.main.cidr_block
}
output "vpc_ipv6_cidr_block" {
  description = "VPC IPv6 CIDR block."
  value       = aws_vpc.main.ipv6_cidr_block
}