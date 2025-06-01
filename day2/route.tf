resource "aws_route_table" "publicRouteTable" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/8"
    gateway_id = aws_internet_gateway.main_gateway.id
  }

  tags = {
    Name = "Public Route Table"
  }
}


resource "aws_route_table" "privateRouteTable" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/8"
    # gateway_id = aws_internet_gateway.main_gateway.id
    nat_gateway_id = aws_nat_gateway.main_nat_gateway.id
  }

  tags = {
    Name = "Private Route Table"
  }
}


resource "aws_route_table_association" "public_route_table_association_1" {
  subnet_id      = aws_subnet.subnets["public_subnet_1"].id
  route_table_id = aws_route_table.publicRouteTable.id
}
resource "aws_route_table_association" "private_route_table_association_1" {
  subnet_id      = aws_subnet.subnets["private_subnet_1"].id
  route_table_id = aws_route_table.privateRouteTable.id
}



# the Other Two Subnets :


resource "aws_route_table_association" "public_route_table_association_2" {
  subnet_id      = aws_subnet.subnets["public_subnet_2"].id
  route_table_id = aws_route_table.publicRouteTable.id
}
resource "aws_route_table_association" "private_route_table_association_2" {
  subnet_id      = aws_subnet.subnets["private_subnet_2"].id
  route_table_id = aws_route_table.privateRouteTable.id
}
