output "instance_id" {
 description = "The ID of the EC2 instance"
 value = aws_instance.wordpress.id
}

output "instance_public_dns" {
 description = "public DNS of wordpress EC2 instance"
 value = aws_instance.wordpress.public_dns
}

