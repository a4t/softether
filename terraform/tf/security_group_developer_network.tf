resource "aws_security_group" "developer_network" {
  name = "vpn_${var.envname}_developer_network"
  vpc_id = "${aws_vpc.vpn.id}"
  description = "vpn ${var.envname} developer network"
}

resource "aws_security_group_rule" "developer_network_tcp22_ingress" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["${formatlist("%s", split(", ", var.developers_ip))}"]

  security_group_id = "${aws_security_group.developer_network.id}"
}
