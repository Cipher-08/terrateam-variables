provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      "Environment" = var.environment
      "createdby"   = "firefly"
    }

  }
}
}

resource "aws_instance" "web" {
  ami                    = "ami-0e86e20dae9224db8"
  instance_type          = "t3.micro"

  tags = {
    "Environment" = var.environment
    "createdby"   = "firefly"
  }
}
