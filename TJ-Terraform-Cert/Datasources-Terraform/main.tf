provider "aws" {
   region = "us-east-1"
}

resource "aws_instance" "WebServer01" {
   ami = "ami-0c94855ba95c71c99"
   instance_type = "t2.micro"
   tags = {
      Name = "WebServer01"
   }
   depends_on = [aws_instance.DBServer01]
}

resource "aws_instance" "DBServer01" {
   ami = "ami-0c94855ba95c71c99"
   instance_type = "t2.micro"
   tags = {
      Name = "DBServer01"
   }
}

data "aws_instance" "DBServerSearch" {
   filter {
      name = "tag:Name"
      values = ["DBServer01"]
   }
}

output "DBServerOutput" {
   value = data.aws_instance.DBServerSearch.availability_zone
}