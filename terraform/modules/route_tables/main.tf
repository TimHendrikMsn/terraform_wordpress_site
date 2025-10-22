resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.env}-${var.name_prefix}-${var.rt_suffix}"
  }
}

resource "aws_route" "public_default_ipv4" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = var.dest_cidr_ipv4
  gateway_id             = var.igw_id
}

resource "aws_route" "public_default_ipv6" {
  route_table_id         = aws_route_table.route_table.id
  destination_ipv6_cidr_block = var.dest_cidr_ipv6
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "route_table_association" {
  count         = length(var.subnet_ids)
  subnet_id     = var.subnet_ids[count.index]
  route_table_id = aws_route_table.route_table.id
}
