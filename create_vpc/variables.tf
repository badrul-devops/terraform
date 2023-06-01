variable "region" {
  type = string
}
variable "instance_amis" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "vpc_cidr_block" {
  type = string
}
variable "subnet_cidr_block" {
  type = string
}
variable "route_table_cidr_block" {
  type = string
}
variable "sg_from_port" {
  type = string
}
variable "sg_to_port" {
  type = string
}

variable "sg_protocol" {
  type = string
}

