## RouteTable作成
resource "aws_route_table" "softether_server" {
  vpc_id = "${aws_vpc.vpn.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "softether_server_${var.envname}"
    Service = "vpn"
    Env = "${var.envname}"
    Role = "softether_server_route_table"
  }
}

## RouteTable Association
resource "aws_route_table_association" "softether_server_zone1" {
  subnet_id = "${aws_subnet.softether_server_zone1.id}"
  route_table_id = "${aws_route_table.softether_server.id}"
}

resource "aws_route_table_association" "softether_server_zone2" {
  subnet_id = "${aws_subnet.softether_server_zone2.id}"
  route_table_id = "${aws_route_table.softether_server.id}"
}
