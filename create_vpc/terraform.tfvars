region = "us-east-1"
instance_amis = "ami-0c55b159cbfafe1f0"
instance_type = "t2.micro"
vpc_cidr_block = "10.10.0.0/24"
subnet_cidr_block = "10.10.1.0/24"
route_table_cidr_block = "0.0.0.0/0"
sg_from_port = "443"
sg_to_port = "443"
sg_protocol = "tcp"