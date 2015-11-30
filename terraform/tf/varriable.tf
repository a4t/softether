variable "aws_region" {}
variable "prefix_ip" {}
variable "envname" {}

provider "aws" {
  region = "${var.aws_region}"
}

variable "role_cidr_ip" {
  default = {
    "softether_server_zone1" = "10.0/28" # 10.0 ~ 10.15
    "softether_server_zone2" = "10.16/28" # 10.16 ~ 10.31
  }
}

variable "availability_zone" {
  default = {
    "zone1" = "ap-northeast-1b"
    "zone2" = "ap-northeast-1c"
  }
}
