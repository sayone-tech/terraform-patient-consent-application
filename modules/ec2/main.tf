data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.EC2_AMI_FILTER]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["099720109477"] // Canonical's AWS account ID
}

output "latest_ubuntu_ami_id" {
  value = data.aws_ami.ubuntu.id
}

resource "aws_instance" "app_server" {
  ami                    = var.EC2_AMI != "" ? var.EC2_AMI : "${data.aws_ami.ubuntu.id}"
  instance_type          = var.EC2_INSTANCE_TYPE
  availability_zone      = var.EC2_AZ
  vpc_security_group_ids = [var.EC2_SG_ID]
  key_name               = var.EC2_PRIVATE_KEY
  iam_instance_profile   = var.IAM_PROFILE
  root_block_device {
    encrypted             = true
    volume_type           = var.EC2_ROOT_VOLUME_TYPE
    volume_size           = var.EC2_ROOT_VOLUME_SIZE
    delete_on_termination = true
  }
  user_data = file(var.EC2_USER_DATA)
  # user_data_base64 = "${base64encode(file(var.EC2_USER_DATA))}"
  credit_specification {
    cpu_credits = var.EC2_CPU_CREDITS
  }

  tags = {
    "Name" = "${var.App_Name}-${var.Name}-${var.Env_Type}"
  }

}