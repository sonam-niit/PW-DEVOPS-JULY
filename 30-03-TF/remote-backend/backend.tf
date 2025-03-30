terraform{
    backend "s3" {
        bucket = "sonam-basket-0c5df26c"
        key = "terraform.tfstate"
        region = "us-east-1"
    }
}
