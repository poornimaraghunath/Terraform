Migrating the aws resources that were created manually on aws console to terraform using the concept of terraform import

* In this example will migrate the aws ec2 resource that was created maually to terraform using the concept of terraform import.

* Import concept was introduced in terraform version 1.5

To create a terraform file for manually created aws resource please enter the below command

terraform init
terraform plan -generate-config-out=generated_resources.tf

once resource file is generated copy the data into main.tf file and then delete the generated_resorce.tf file

But still terraform doesn't understand that the resource is already created on aws.

For that you need to create the terraform.tfstate file by using the below command
<<<<<<< HEAD
  
=======
  terraform import aws_instance.example i-002460bb0a1051b43
>>>>>>> ab8e67d9f50dcd51fee1401dd1c32275e3d9abcb
