resource "aws_vpc" "wordpress_vpc" {
    cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "wordpress_subnet" {
  vpc_id = var.vpc_id != null ? var.vpc_id : aws_vpc.wordpress_vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.aws_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_internet_gateway" "wordpress_IGW" {
  vpc_id = var.vpc_id != null ? var.vpc_id : aws_vpc.wordpress_vpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "wordpress_route" {
    vpc_id = var.vpc_id != null ? var.vpc_id : aws_vpc.wordpress_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.wordpress_IGW.id
    }

    tags = {
        Name = var.route_table_name
    }

}

resource "aws_route_table_association" "route_association" {
        subnet_id = aws_subnet.wordpress_subnet.id 
        route_table_id = aws_route_table.wordpress_route.id    

}

resource "aws_security_group" "wordpress_sg" {
  name = var.sg_name
  vpc_id = var.vpc_id != null ? var.vpc_id : aws_vpc.wordpress_vpc.id

#Inbound
ingress {
    description = "Allow HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.allowed_cidr]
}

ingress {
    description = "Allow HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [var.allowed_cidr]
}

ingress {
    description = "Allow SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.allowed_cidr]
}

egress {
    description = "Allow outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

}
