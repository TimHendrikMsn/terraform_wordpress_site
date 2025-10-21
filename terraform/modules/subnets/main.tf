
resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  availability_zone       = var.availability_zone
  cidr_block              = var.cidr_subnet
  map_public_ip_on_launch = var.map_public_ip_on_launch
  ipv6_cidr_block         = var.cidr_subnet_ipv6
  assign_ipv6_address_on_creation = true

  tags = {
    Name = "${var.env}-${var.name_prefix}-${var.subnet_suffix}"
  }
}


