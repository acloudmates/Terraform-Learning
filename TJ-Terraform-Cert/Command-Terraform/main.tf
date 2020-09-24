provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "myvpc01" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MY-VPC-01"
  }
}

resource "aws_vpc" "myvpc01" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MY-VPC-02"
  }
}