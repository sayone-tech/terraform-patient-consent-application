variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "ap-southeast-1"
}

variable "Name" {
  type        = string
  description = "Name of the service to be added"
}

variable "App_Name" {
  type        = string
  description = "Application Name"
}

variable "Env_Type" {
  type        = string
  description = "Application Env type"
}

variable "EC2_AMI" {
  type        = string
  default     = ""
  description = "AMI to be used to create the EC2 instance"
}

variable "EC2_AMI_FILTER" {
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
  description = "AMI name to be used to create the EC2 instance"
}
variable "EC2_INSTANCE_TYPE" {
  type        = string
  default     = "t3.micro"
  description = "Type of Ec2 instance to be created"
}

variable "EC2_PRIVATE_KEY" {
  type        = string
  default     = ""
  description = "SSH private key for EC2 instance "
}

variable "EC2_USER_DATA" {
  type        = string
  default     = ""
  description = "sh file with commands that needs to be ran in the ec2 instance during start up"
}

variable "EC2_AZ" {
  type        = string
  default     = ""
  description = "EC2 AZ's"
}

variable "EC2_SG_ID" {
  description = "Ec2 security Group"
}

variable "EC2_ROOT_VOLUME_TYPE" {
  description = "Ec2 Root Volume type"
  default     = "gp2"
}

variable "EC2_ROOT_VOLUME_SIZE" {
  type        = number
  description = "Ec2 Root Volume Size"
  default     = "8"
}

variable "IAM_PROFILE" {
  description = "IAM instance profile name"
}

variable "EC2_CPU_CREDITS" {
  type        = string
  default     = "standard"
  description = "EC2 Credit option for CPU usage. Valid values include standard or unlimited"
}


