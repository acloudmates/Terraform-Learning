variable "db_name" {
   type = string
}

resource "aws_instance" "db_server_01" {
   ami = "ami-0c94855ba95c71c99"
   instance_type = "t2.micro"

   tags = {
      Name = var.db_name
   }
}