variable "ami" {
  description = "AMI for Ubuntu EC2 instance"
  type = string
  default = "ami-046c2381f11878233"
}

variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2.micro"
}


variable "key_name" {
    description = "name of EC2 key pair for SSH access"
    type = string
    default = "wordpress-key"
}

variable "public_key_path" {
  description = "local file path to SSH public key"
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

variable "db_name" {
  description = "name of database for wordpress"
  type = string
  default = "wordpress"
}

variable "db_user" {
  description = "username for wordpress"
  type = string
  default = "wpuser"
}

variable "db_password" {
  description = "password for wordpress"
  type = string
  sensitive = true
}