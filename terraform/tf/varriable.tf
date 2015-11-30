variable "aws_region" {}
variable "prefix_ip" {}
variable "envname" {}

provider "aws" {
  region = "${var.aws_region}"
}

variable "role_cidr_ip" {
  default = {
    "softether_server_zone1" = "0/28" # [prefix_ip].0 ~ [prefix_ip].15
    "softether_server_zone2" = "16/28" # [prefix_ip].16 ~ [prefix_ip].31
  }
}

variable "availability_zone" {
  default = {
    "zone1" = "ap-northeast-1b"
    "zone2" = "ap-northeast-1c"
  }
}

variable "key_pair" {}

variable "developers_ip" {
  default = "0.0.0.0/0"
}

variable "ami_id" {
  default = {
    "softether" = "ami-936d9d93"
  }
}

variable "instance_type" {
  default = {
    "softether" = "t2.micro"
  }
}