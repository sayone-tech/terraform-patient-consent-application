module "secrets_manager" {
  source   = "./modules/secrets_manager"
  Name     = var.Name
  App_Name = var.App_Name
  Env_Type = var.Env_Type

}

module "ecr" {
  source   = "./modules/ecr"
  Name     = var.Name
  App_Name = var.App_Name
  Env_Type = var.Env_Type

}

module "iam" {
  depends_on = [
    module.ecr,
    module.secrets_manager
  ]
  source = "./modules/iam"

  ECR_ARN            = module.ecr.ecr_arn
  SECRETSMANAGER_ARN = module.secrets_manager.secretsmanager_arn
  Name               = var.Name # add IAM role name required here
  App_Name           = var.App_Name
  Env_Type           = var.Env_Type
}


module "webapp_ec2_sg" {
  source   = "./modules/ec2_sg"
  Name     = var.Name
  App_Name = var.App_Name
  Env_Type = var.Env_Type

}

module "webapp_ec2" {
  depends_on = [
    module.ecr,
    module.secrets_manager,
    module.iam,
    module.webapp_ec2_sg
  ]
  source = "./modules/ec2"

  Name              = var.Name
  App_Name          = var.App_Name
  Env_Type          = var.Env_Type
  EC2_AMI_FILTER    = var.EC2_AMI_FILTER
  EC2_INSTANCE_TYPE = var.EC2_INSTANCE_TYPE
  EC2_PRIVATE_KEY   = var.EC2_PRIVATE_KEY
  EC2_AZ            = var.EC2_AZ
  EC2_SG_ID         = module.webapp_ec2_sg.sg_id_ec2
  IAM_PROFILE       = module.iam.ec2_iam_profile

  #Optional Envs    
  EC2_AMI       = var.EC2_AMI
  EC2_USER_DATA = var.EC2_USER_DATA
  # EC2_ROOT_VOLUME_TYPE  = var.EC2_ROOT_VOLUME_TYPE
  # EC2_ROOT_VOLUME_SIZE  = var.EC2_ROOT_VOLUME_SIZE
  # EC2_CPU_CREDITS = var.EC2_CPU_CREDITS
}

# module "webapp_ip" {
#   depends_on = [module.webapp_ec2]
#   source     = "./modules/elastic_ip"

#   EC2_INSTANCE_ID = module.webapp_ec2.EC2_INSTANCE_ID
# }
