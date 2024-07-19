resource "aws_internet_gateway" "task-igw" {
  vpc_id = aws_vpc.task-vpc.id

  tags = {
    Name = "TaskIGW"
  }
}
resource "aws_route_table" "task-RT" {
  vpc_id = aws_vpc.task-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.task-igw.id
  }

  tags = {
    Name = "RoutingTable"
  }
}

resource "aws_route_table_association" "public-subnet-ac" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.task-RT.id
}

resource "aws_route_table_association" "private-subnet-ac" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.task-RT.id
}