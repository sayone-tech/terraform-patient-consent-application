output "EC2_instance_ID" {
  description = "Ec2 Instance ID"
  value       = module.webapp_ec2.EC2_INSTANCE_ID
}

# output "EC2_instance_Public_IP" {
#   description = "Ec2 Public IP"
#   value       = module.webapp_ip.Elastic_Public_IP
# }

# output "EC2_instance_Private_IP" {
#   description = "Ec2  Private IP"
#   value       = module.webapp_ip.Elastic_Private_IP
# }

output "EC2_instance_SG" {
  description = "Ec2 Security Group ID"
  value       = module.webapp_ec2_sg.sg_id_ec2
}

output "Secrets_Manger_ARN" {
  description = "Secrets Manager ARN"
  value       = module.secrets_manager.secretsmanager_arn
}

output "AWS_ECR_URL" {
  description = "Ec2 Security Group ID"
  value       = module.ecr.ecr_repository_url
}







