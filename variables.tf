#Provider Env variables
variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "ap-southeast-1"
}

variable "aws_profile" {
  type        = string
  description = "AWS profile"
  default     = "default"
}

variable "aws_credentials_file" {
  type        = list(string)
  default     = ["~/.aws/credentials"]
  description = "AWS credentials file in local"
}

#resource Env variables
variable "App_Name" {
    type = string
    description = "Application Name"
}

variable "Env_Type" {
    type = string
    description = "Application Env type"
}


variable "EC2_AMI" {
  type        = string
  description = "AMI name to be used to create the EC2 instance"
}

variable "EC2_INSTANCE_TYPE" {
  type        = string
  default     = "t2.micro"
  description = "Type of Ec2 instance to be created"
}

variable "EC2_PRIVATE_KEY" {
  type        = string
  default     = ""
  description = "SSH private key for EC2 instance "
}

# variable "EC2_USER_DATA" {
#   type        = string
#   description = "sh file with commands that needs to be ran in the ec2 instance during start up"
# }

variable "EC2_AZ" {
  type        = string
  default     = ""
  description = "EC2 AZ's"
}

variable "EC2_ROOT_VOLUME_TYPE" {
    description = "Ec2 Root Volume type"
    default = "gp2"
}

variable "EC2_ROOT_VOLUME_SIZE" {
    type = number
    description = "Ec2 Root Volume Size"
    default = "8"
}