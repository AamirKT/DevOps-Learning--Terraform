output "vpc_id" {
  description = "The ID of the VPC"
  value = aws_vpc.wordpress_vpc.id
}

output "subnet_id" {
 description = "The ID of the public subnet"
 value = aws_subnet.wordpress_subnet.id
}

output "sg_id" {
 description = "The ID of the security group"
 value = aws_security_group.wordpress_sg.id
}

