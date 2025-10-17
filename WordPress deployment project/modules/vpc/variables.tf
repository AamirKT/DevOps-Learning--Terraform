variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
    description = "CIDR block for subnet"
    default = "10.0.0.0/24"
}

variable "aws_availability_zone" {
default = "eu-west-2a"
}

variable "vpc_name" {
  default = "wordpress_vpc"
}

variable "subnet_name" {
  default = "wordpress_subnet"
}

variable "igw_name" {
  default = "wordpress_igw"
}

variable "route_table_name" {
  default = "wordpress_routes"
}

variable "vpc_id" {
    description = "Optional existing VPC ID. If null, a new VPC will be created"
    type = string
    default = null
}

variable "subnet_id" {
  type = string
  default = "aws_subnet.id"
}

variable "sg_name" {
  description = "name of security group"
  type = string
  default = "wordpress_sg"
}

variable "aws_security_group" {
  description = "ID of security group"
  type = string
  default = "aws_security_group.id"
}

variable "allowed_cidr" {
  description = "CIDR block allowed to access the EC2 "
  type = string
  default = "0.0.0.0/0"
}




