provider "aws" {
  region = "us-east-1"
}

provider "vault" {
    address = "http://54.221.191.34:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "e250e843-cfe2-3dac-ccaf-fa8e3087be7c"
      secret_id = "cb559227-833d-0f45-4b8d-877eb11e4753"
    }
  }
}


data "vault_kv_secret_v2" "example" {
  mount = "kv" 
  name  = "test-secret" 
}

resource "aws_instance" "demo" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"

    tags = {
        secret = data.vault_kv_secret_v2.example.data["username"]
    }
  
}
