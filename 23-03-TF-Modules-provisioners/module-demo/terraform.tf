# terraform {
#   backend "s3" {
#     bucket = "sonam-basket-1234"
#     key = "global/s3/terraform.tfstate"
#     region = "us-east-1"
#   }
# }

# After this again you can do terraform init
# it will promp to copy terraform.tfstate in s3 bucket so you can say yes
# file will be copied. 