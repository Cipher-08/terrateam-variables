provider "aws" {
  region     = "us-west-2"

}

resource "aws_instance" "example" {
  ami           = "ami-0e86e20dae9224db8" # Replace with your desired AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformExample"
  }
}

