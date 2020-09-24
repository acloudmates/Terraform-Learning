provider "aws" {
   region = "us-east-1"
}

variable "ingress_rules" {
   type = list(number)
   default = [22,443,80, 8080]
}

variable "egress_rules" {
   type = list(number)
   default = [22,443,80, 8080]
}

resource "aws_instance" "WebServer01" {
   ami = "ami-0c94855ba95c71c99"
   availability_zone = "us-east-1a"
   instance_type = "t2.micro"
   security_groups = [aws_security_group.WebDMZ01.name]
   tags = {
      Name = "WebServer01"
   }
}

resource "aws_security_group" "WebDMZ01" {
   name = "WebDMZ01"
   dynamic "ingress"{
      iterator = port
      for_each = var.ingress_rules
      content {
         from_port = port.value
         to_port = port.value
         protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
      }
   }

   dynamic "egress"{
      iterator = port
      for_each = var.egress_rules
      content {
         from_port = port.value
         to_port = port.value
         protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
      }
   }
}