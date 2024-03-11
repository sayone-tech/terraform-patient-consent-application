resource "aws_instance" "app_server" {
    ami                     = var.EC2_AMI
    instance_type           = var.EC2_INSTANCE_TYPE
    availability_zone       = var.EC2_AZ
    vpc_security_group_ids  = [var.EC2_SG_ID]
    key_name                = var.EC2_PRIVATE_KEY
    iam_instance_profile    = var.IAM_PROFILE 
    root_block_device {
        encrypted   = true
        volume_type = var.EC2_ROOT_VOLUME_TYPE
        volume_size = var.EC2_ROOT_VOLUME_SIZE
        delete_on_termination = true
    }
}