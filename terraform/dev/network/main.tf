module "vpc" {
  source      = "../../modules/vpc"
  env         = var.env
  name_prefix = var.name_prefix

  cidr_block = var.vpc_cidr_block
}

module "igw" {
  source      = "../../modules/igw"
  env         = var.env
  name_prefix = var.name_prefix

  vpc_id = module.vpc.vpc_id
}

module "sg_entrypoint" {
  source      = "../../modules/security_groups"
  env         = var.env
  name_prefix = var.name_prefix
  sg_suffix   = "entrypoint-tcp"
  
  name        = "SG EntryPoint TCP"
  description = "Allow TCP IN and all OUT"
  vpc_id = module.vpc.vpc_id

  ingress_description = "Allow TCP IN"
  ingress_from_port = 80
  ingress_to_port   = 80
  ingress_protocol  = "tcp"
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_from_port        = 0
  egress_to_port          = 0
  egress_protocol         = "-1"
  egress_cidr_blocks      = ["0.0.0.0/0"]
  egress_ipv6_cidr_blocks = ["::/0"]

}

module "sg_database" {
  source      = "../../modules/security_groups"
  env         = var.env
  name_prefix = var.name_prefix
  sg_suffix   = "database"
  
  name        = "SG Database"
  description = "Control access to a Database from an Entry Point"
  vpc_id = module.vpc.vpc_id

  ingress_description     = "Allow MySQL IN from Entry Point"
  ingress_from_port       = 3306
  ingress_to_port         = 3306
  ingress_protocol        = "tcp"
  ingress_security_groups = [module.sg_entrypoint.sg_id]

  egress_from_port        = 0
  egress_to_port          = 0
  egress_protocol         = "-1"
  egress_cidr_blocks      = ["0.0.0.0/0"]
  egress_ipv6_cidr_blocks = ["::/0"]
}



module "subnet_pub_a" {
  source      = "../../modules/subnets"
  env         = var.env
  name_prefix = var.name_prefix

  vpc_id                  = module.vpc.vpc_id
  availability_zone       = data.aws_availability_zones.available.names[0]
  cidr_subnet             = cidrsubnet(module.vpc.vpc_cidr_block, 4, 3)
  map_public_ip_on_launch = true
  cidr_subnet_ipv6        = cidrsubnet(module.vpc.vpc_ipv6_cidr_block, 8, 3)
  subnet_suffix           = "sn-pub-A"
}

module "subnet_pub_b" {
  source      = "../../modules/subnets"
  env         = var.env
  name_prefix = var.name_prefix

  vpc_id                  = module.vpc.vpc_id
  availability_zone       = data.aws_availability_zones.available.names[1]
  cidr_subnet             = cidrsubnet(module.vpc.vpc_cidr_block, 4, 7)
  map_public_ip_on_launch = true
  cidr_subnet_ipv6        = cidrsubnet(module.vpc.vpc_ipv6_cidr_block, 8, 7)
  subnet_suffix           = "sn-pub-B"
}

module "subnet_pub_c" {
  source      = "../../modules/subnets"
  env         = var.env
  name_prefix = var.name_prefix

  vpc_id                  = module.vpc.vpc_id
  availability_zone       = data.aws_availability_zones.available.names[2]
  cidr_subnet             = cidrsubnet(module.vpc.vpc_cidr_block, 4, 11)
  map_public_ip_on_launch = true
  cidr_subnet_ipv6        = cidrsubnet(module.vpc.vpc_ipv6_cidr_block, 8, 11)
  subnet_suffix           = "sn-pub-C"
}

module "subnet_app_a" {
  source      = "../../modules/subnets"
  env         = var.env
  name_prefix = var.name_prefix

  vpc_id                  = module.vpc.vpc_id
  availability_zone       = data.aws_availability_zones.available.names[0]
  cidr_subnet             = cidrsubnet(module.vpc.vpc_cidr_block, 4, 2)
  map_public_ip_on_launch = false
  cidr_subnet_ipv6        = cidrsubnet(module.vpc.vpc_ipv6_cidr_block, 8, 2)
  subnet_suffix           = "sn-app-A"
}

module "subnet_app_b" {
  source      = "../../modules/subnets"
  env         = var.env
  name_prefix = var.name_prefix

  vpc_id                  = module.vpc.vpc_id
  availability_zone       = data.aws_availability_zones.available.names[1]
  cidr_subnet             = cidrsubnet(module.vpc.vpc_cidr_block, 4, 6)
  map_public_ip_on_launch = false
  cidr_subnet_ipv6        = cidrsubnet(module.vpc.vpc_ipv6_cidr_block, 8, 6)
  subnet_suffix           = "sn-app-B"
}

module "subnet_app_c" {
  source      = "../../modules/subnets"
  env         = var.env
  name_prefix = var.name_prefix

  vpc_id                  = module.vpc.vpc_id
  availability_zone       = data.aws_availability_zones.available.names[2]
  cidr_subnet             = cidrsubnet(module.vpc.vpc_cidr_block, 4, 10)
  map_public_ip_on_launch = false
  cidr_subnet_ipv6        = cidrsubnet(module.vpc.vpc_ipv6_cidr_block, 8, 10)
  subnet_suffix           = "sn-app-C"
}

module "subnet_db_a" {
  source      = "../../modules/subnets"
  env         = var.env
  name_prefix = var.name_prefix

  vpc_id                  = module.vpc.vpc_id
  availability_zone       = data.aws_availability_zones.available.names[0]
  cidr_subnet             = cidrsubnet(module.vpc.vpc_cidr_block, 4, 1)
  map_public_ip_on_launch = false
  cidr_subnet_ipv6        = cidrsubnet(module.vpc.vpc_ipv6_cidr_block, 8, 1)
  subnet_suffix           = "sn-db-A"
}

module "subnet_db_b" {
  source      = "../../modules/subnets"
  env         = var.env
  name_prefix = var.name_prefix

  vpc_id                  = module.vpc.vpc_id
  availability_zone       = data.aws_availability_zones.available.names[1]
  cidr_subnet             = cidrsubnet(module.vpc.vpc_cidr_block, 4, 5)
  map_public_ip_on_launch = false
  cidr_subnet_ipv6        = cidrsubnet(module.vpc.vpc_ipv6_cidr_block, 8, 5)
  subnet_suffix           = "sn-db-B"
}

module "subnet_db_c" {
  source      = "../../modules/subnets"
  env         = var.env
  name_prefix = var.name_prefix

  vpc_id                  = module.vpc.vpc_id
  availability_zone       = data.aws_availability_zones.available.names[2]
  cidr_subnet             = cidrsubnet(module.vpc.vpc_cidr_block, 4, 9)
  map_public_ip_on_launch = false
  cidr_subnet_ipv6        = cidrsubnet(module.vpc.vpc_ipv6_cidr_block, 8, 9)
  subnet_suffix           = "sn-db-C"
}