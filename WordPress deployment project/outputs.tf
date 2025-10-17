output "instance_id" {
 description = "The ID of the EC2 instance"
 value = module.ec2.instance_id
}

output "instance_public_dns" {
 description = "public DNS of wordpress EC2 instance"
 value = module.ec2.instance_public_dns
}

output "vpc_id" {
  description = "The ID of the VPC"
  value = module.vpc.vpc_id
}

output "subnet_id" {
 description = "The ID of the public subnet"
 value = module.vpc.subnet_id
}

output "sg_id" {
 description = "The ID of the security group"
 value = module.vpc.sg_id
}