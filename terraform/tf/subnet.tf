## Subnet作成
resource "aws_subnet" "softether_server_zone1" {
  vpc_id = "${aws_vpc.vpn.id}"
  cidr_block = "${var.prefix_ip}.${var.role_cidr_ip["softether_server_zone1"]}"
  availability_zone = "${var.availability_zone["zone1"]}"

  tags {
    Name = "vpn_${var.envname}_softether_server_zone1"
    Service = "vpn"
    Env = "${var.envname}"
    Role = "softether_server_zone1"
  }
}

resource "aws_subnet" "softether_server_zone2" {
  vpc_id = "${aws_vpc.vpn.id}"
  cidr_block = "${var.prefix_ip}.${var.role_cidr_ip["softether_server_zone2"]}"
  availability_zone = "${var.availability_zone["zone2"]}"

  tags {
    Name = "vpn_${var.envname}_softether_server_zone2"
    Service = "vpn"
    Env = "${var.envname}"
    Role = "softether_server_zone2"
  }
}
