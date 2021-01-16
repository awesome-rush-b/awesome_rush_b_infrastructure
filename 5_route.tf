resource "aws_route_table" "alpha_route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "${var.project_name}_alpha_route"
  }
}

# resource "aws_route_table" "beta_route" {
#   vpc_id = aws_vpc.vpc.id

#   route {
#     cidr_block = "0.0.0.0/0" // 让 alpha 拥有对外通讯能力
#     gateway_id = aws_internet_gateway.ig.id
#   }

#   tags = {
#     Name = "${var.project_name}_beta_oute"
#   }
# }

resource "aws_route_table_association" "alpha" {
  // 将子网和路由相关联
  subnet_id      = aws_subnet.alpha_subnet.id
  route_table_id = aws_route_table.alpha_route.id
}

resource "aws_route_table_association" "beta" {
  // 将子网和路由相关联
  subnet_id      = aws_subnet.beta_subnet.id
  route_table_id = aws_route_table.alpha_route.id
}

resource "aws_route_table_association" "charle" {
  // 将子网和路由相关联
  subnet_id      = aws_subnet.charle_subnet.id
  route_table_id = aws_route_table.alpha_route.id
}


resource "aws_route_table_association" "delta" {
  // 将子网和路由相关联
  subnet_id      = aws_subnet.delta_subnet.id
  route_table_id = aws_route_table.alpha_route.id
}