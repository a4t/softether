resource "aws_instance" "softether" {
  ami = "${var.ami_id.softether}"
  instance_type = "${var.instance_type.softether}"
  iam_instance_profile = "${aws_iam_instance_profile.softether.name}"

  subnet_id = "${aws_subnet.softether_server_zone1.id}"
  vpc_security_group_ids = [
    "${aws_security_group.softether.id}",
    "${aws_security_group.developer_network.id}"
  ]

  root_block_device = {
    volume_type = "gp2"
    volume_size = "20"
  }

  user_data = "${file("./userdatas/softether")}"
  key_name = "${var.key_pair}"

  tags {
    Name = "vpn_${var.envname}_softether_server_zone1"
    Service = "vpn"
    Env = "${var.envname}"
    Role = "softether_server_zone1"
  }
}

resource "aws_eip" "softether_zone1_ip" {
  instance = "${aws_instance.softether.id}"
  vpc = true
}
