# Launch Configuration 作成
resource "aws_launch_configuration" "softether" {
  name = "vpn_${var.envname}_softether"
  image_id = "${var.ami_id.softether}"
  instance_type = "${var.instance_type.softether}"
  security_groups = [
    "${aws_security_group.softether.id}",
    "${aws_security_group.developer_network.id}"
  ]
  key_name = "private"
  iam_instance_profile = "${aws_iam_instance_profile.softether.arn}"
  associate_public_ip_address = true
  root_block_device = {
    volume_type = "gp2"
    volume_size = "20"
  }
  user_data = "${file("./userdatas/softether")}"
}