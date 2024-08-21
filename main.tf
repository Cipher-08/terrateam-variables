provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      "Environment" = var.environment
      "createdby"   = "firefly"
    }

  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_availability_zones" "available" {
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name                    = "firefly-vpc"
  cidr                    = "10.42.0.0/16"
  azs                     = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnets          = ["10.42.0.0/24", "10.42.1.0/24"]
  map_public_ip_on_launch = true

}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.image_id
  instance_type          = "t3.micro"
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.vpc.default_security_group_id]

  key_name = ""

  tags = {
    "Environment" = var.environment
    "createdby"   = "firefly"
  }
}
