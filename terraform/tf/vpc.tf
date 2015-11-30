## VPC作成
resource "aws_vpc" "vpn" {
  cidr_block = "${var.prefix_ip}.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags {
    Name = "vpn_${var.envname}"
    Service = "vpn"
    Env = "${var.envname}"
    Role = "vpc"
  }
}

## インターネットゲートウェイ作成
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpn.id}"

  tags {
    Name = "vpn_${var.envname}_gateway"
    Service = "vpn"
    Env = "${var.envname}"
    Role = "internet_gateway"
  }
}