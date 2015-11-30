resource "aws_security_group" "softether" {
  name = "vpn_${var.envname}_softether"
  vpc_id = "${aws_vpc.vpn.id}"
  description = "vpn ${var.envname} softether"
}

resource "aws_security_group_rule" "softether_allow_all_egress" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.softether.id}"
}

resource "aws_security_group_rule" "softether_tcp443_ingress" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.softether.id}"
}

resource "aws_security_group_rule" "softether_tcp992_ingress" {
  type = "ingress"
  from_port = 992
  to_port = 992
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.softether.id}"
}

resource "aws_security_group_rule" "softether_tcp1194_ingress" {
  type = "ingress"
  from_port = 1194
  to_port = 1194
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.softether.id}"
}

resource "aws_security_group_rule" "softether_tcp5555_ingress" {
  type = "ingress"
  from_port = 5555
  to_port = 5555
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.softether.id}"
}

resource "aws_security_group_rule" "softether_udp1194_ingress" {
  type = "ingress"
  from_port = 1194
  to_port = 1194
  protocol = "udp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.softether.id}"
}

resource "aws_security_group_rule" "softether_udp500_ingress" {
  type = "ingress"
  from_port = 500
  to_port = 500
  protocol = "udp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.softether.id}"
}

resource "aws_security_group_rule" "softether_udp4500_ingress" {
  type = "ingress"
  from_port = 4500
  to_port = 4500
  protocol = "udp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.softether.id}"
}
