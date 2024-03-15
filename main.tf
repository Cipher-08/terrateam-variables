terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0" 
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "terrateam-bucket081" {
  type    = string
<<<<<<< HEAD
  default = "terrateam-dev-bucket-trial3"
=======
  default = "terrateam-dev-bucket-trial2"
>>>>>>> origin/terraform-dev
}

resource "aws_s3_bucket" "terrateam-bucket081" {
  bucket = var.terrateam-bucket081
}
