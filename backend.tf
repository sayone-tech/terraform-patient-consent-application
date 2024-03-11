terraform {
  backend "s3" {
    bucket                  = "devopskid-terraform-backend"
    key                     = "ec2-sg-ecr-sm-dev/terraform.tfstate"
    region                  = "ap-southeast-1"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "my-terraform-admin"
  }
}