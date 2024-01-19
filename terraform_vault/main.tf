provider "aws" {
  region = "us-east1"
}

provider "vault" {
    address = "http://54.221.191.34:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "e250e843-cfe2-3dac-ccaf-fa8e3087be7c"
      secret_id = "07f55b33-b2b5-f2a6-3dc0-89fd4b828fbe"
    }
  }
}


data "vault_kv_secret_v2" "example" {
  mount = "kv" 
  name  = "test-secret" 
}

resource "aws_instance" "demo" {
    ami = ""
    instance_type = "t2.micro"

    tags = {
        secret = data.vault_kv_secret_v2.example.data["username"]
    }
  
}
