provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "C:/Github/Terraform/terraform_module/modules/ec2_instance"
  ami_id = "ami-0c7217cdde317cfec"
  instance_type = "t2.large"
}