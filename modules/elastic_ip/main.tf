resource "aws_eip" "eip" {
  domain            = "vpc"
  instance          = var.EC2_INSTANCE_ID
  # lifecycle {
  #   prevent_destroy = true
  # }
}