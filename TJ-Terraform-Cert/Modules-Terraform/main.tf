provider "aws" {
   region = "us-east-1"
}

resource "aws_instance" "WebServer01" {
   ami = "ami-0c94855ba95c71c99"
   instance_type = "t2.micro"

   tags = {
      Name = "WebServer01"
   }
}

module "DBServer01"{
   source = "./dbmodule/mysql"
   db_name = "DBSrv-01"
}

output "db_private_ip" {
   value = module.DBServer01.db_server_private_ip
}