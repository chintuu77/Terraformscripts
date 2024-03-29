#route table creation

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.vivek.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vivek-gateway.id
  }
  tags = {
    Name = "route to internet"
  }
}

#route 1

resource "aws_route_table_association" "route1" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.route.id
}

#route 2

resource "aws_route_table_association" "route2" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.route.id
}
