provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./module/vpc"
}


resource "aws_route_table" "public" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  
}

resource "aws_route_table_association" "public" {
  subnet_id      = module.vpc.subnet_id
  route_table_id = aws_route_table.public.id
}

module "sg" {
  source = "./module/sg"
  name   = "zabbix-sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./module/ec2"
  key_name          = var.key_name
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.sg.sg_id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = module.vpc.vpc_id
}

resource "local_file" "inventory" {
  content = <<EOT
[zabbix_agent]
${module.ec2.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/${var.key_name}.pem
EOT

  filename = "../ansible/inventory"
}