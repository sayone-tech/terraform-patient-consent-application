provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = var.aws_credentials_file
  profile                  = var.aws_profile

  default_tags {
    tags = {
      "Name"     = "${var.App_Name}-${var.Env_Type}"
      "Env_Type" = var.Env_Type
    }
  }
}
