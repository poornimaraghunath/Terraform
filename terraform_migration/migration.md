Migrating the aws resources that were created manually on aws console to terraform using the concept of terraform import

* In this example will migrate the aws ec2 resource that was created maually to terraform using the concept of terraform import.

* Import concept was introduced in terraform version 1.5

To create a terraform file for manually created aws resource please enter the below command
terraform init
terraform plan -generate-config-out=generated_resources.tf

once resource file is generated copy the data into main.tf file and then delete the generated_resorce.tf file

But still terraform doesn't understand that the resource is already created on aws.

For that you need to create the terraform.tfstate file by using the below command
  