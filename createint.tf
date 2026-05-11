terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "MyFirstInstance" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t3.micro"

  subnet_id = "subnet-0dbad8f3a38b99346"

  tags = {
    Name = "My-First-Terraform-Instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.MyFirstInstance.public_ip
}
