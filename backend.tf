terraform {
  backend "s3" {
    bucket                  = "sayone-terraform-backend"
    key                     = "patient-consent-application/terraform.tfstate"
    region                  = "ap-southeast-1"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "nijo-sayone"
  }
}