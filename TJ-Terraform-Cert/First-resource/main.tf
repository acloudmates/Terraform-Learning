provider "aws" {
   region = "us-east-1"
   # access_key = ""
   # secret_key = ""
}

resource "aws_vpc" "MyVPC-01" {
   cidr_block = "10.0.0.0/16"
   tags = {
      Name = "A4L-VPC01"
   }
}

