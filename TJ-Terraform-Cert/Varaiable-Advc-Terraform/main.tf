provider "aws" {
   region = "us-east-1"
}

variable "vpc_name" {
   type = string
   description = "Please provide a name to you VPC: "
}

resource "aws_vpc" "myvpc" {
   cidr_block = "10.0.0.0/16"
   tags = {
      Name = var.vpc_name
   }
}

