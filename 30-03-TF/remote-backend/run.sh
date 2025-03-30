terraform init
terraform apply -auto-approve

BUCKET_NAME=$(terraform output -raw bucket_name)

cat > backend.tf <<EOF
terraform{
    backend "s3" {
        bucket = "$BUCKET_NAME"
        key = "terraform.tfstate"
        region = "us-east-1"
    }
}
EOF

terraform init