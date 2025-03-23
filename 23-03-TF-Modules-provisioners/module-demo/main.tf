provider "aws" {
  region = "us-east-1"
}

module "web-server" {
  source = "./modules/ec2-instance"
  instance_name = "sonamvm"
  instance_type = "t2.micro"
  image_id = "ami-084568db4383264d4"
}
module "s3_bucket" {
  source = "./modules/s3-bucket"
  bucket_name = "sonam-basket-1234"
  environment = "dev"
}