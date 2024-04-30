aws_region  = "ap-southeast-1"
aws_profile = "nijo-sayone"
App_Name    = "patient-consent-application"
Env_Type    = "dev"
# EC2_AMI           = "ami-08f7912c15ca96832"
EC2_INSTANCE_TYPE = "t3.micro"
EC2_PRIVATE_KEY   = "patient-consent-application-dev"

##Optional Envs
EC2_AZ        = "ap-southeast-1a"
EC2_USER_DATA = "templates/install-scripts.sh"
# EC2_ROOT_VOLUME_TYPE = "gp3"
# EC2_ROOT_VOLUME_SIZE = "10"
