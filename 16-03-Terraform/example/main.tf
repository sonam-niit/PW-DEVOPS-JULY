provider "local" {}

resource "local_file" "example" {
  filename = "hello.txt"
  content = "Hello from Terraform!!!.."
}

# open this folder in wsl
# execute terraform init
# execute terraform plan
# execute terraform apply

