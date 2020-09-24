provider "aws"{
   region = "us-east-1"
}

variable "vpc_name"{
   type = string
   default = "A4L-VPCA"
}

variable "ssh_port" {
   type = number
   default = 22
}

variable "enabled" {
   default = true
}

variable "port_numbers" {
   type = list(number)
   default = [22,443, 80]
}

variable "maps_terrform" {
   type = map
   default = {
      key1 = "value1"
      key2 = "value2"
   }
}

# input the variable in terraform

variable "vpc_name_input"{
   type = string
   description = "Please provide the name of VPC of your choice: "
}

resource "aws_vpc" "MyVPC" {
   cidr_block = "16.0.0.0/16"
   tags = {
      Name = var.vpc_name_input
   }
}

output "my_vpc_name" {
   value = aws_vpc.MyVPC.id
}