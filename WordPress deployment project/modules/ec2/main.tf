# Generate SSH key locally
resource "tls_private_key" "wordpress-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS key pair from generated public key
resource "aws_key_pair" "wordpress-key" {
  key_name   = var.key_name
  public_key = tls_private_key.wordpress-key.public_key_openssh
}

# Save the private key locally (optional, for SSH)
resource "local_file" "private_key" {
  content        = tls_private_key.wordpress-key.private_key_pem
  filename       = "${path.module}/wordpress-key.pem"
  file_permission = "0400"
}


resource "aws_instance" "wordpress" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = [var.aws_security_group]
    key_name = aws_key_pair.wordpress-key.key_name
    
    associate_public_ip_address = true

#   Use the user_data template for wordpress setup
user_data = templatefile("${path.module}/user_data.tftpl", {

db_name = var.db_name
db_user = var.db_user
db_password = var.db_password

})
}