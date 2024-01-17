provider "aws" {
  region = us-east-1
}

variable "ami" {
  description = "value"
}

variable "instance_type" {
  description = "value"

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.xlarge"
  }
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami = var.ami
  instance_type = var.instance_type
  
}