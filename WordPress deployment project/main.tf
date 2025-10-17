module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source = "./modules/ec2"
  db_password = var.db_password
  public_key_path = var.public_key_path
  subnet_id = module.vpc.subnet_id
  aws_security_group = module.vpc.sg_id
}

