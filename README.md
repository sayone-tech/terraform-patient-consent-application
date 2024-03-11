This terraform config files creates an AWS EC2 instance with security group for Webaccess and an elastic IP,ECR,SecretsManger, IAM role for the EC2 instance to access the services from EC2 and IAM user for access the resources from the Jenkins pipline.


## Requirements

- You must have [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)  installed.
- You must have an [AWS](https://console.aws.amazon.com/) account.

## Pre-requisite

* Configure your AWS access keys.

    * **Important**: For security, it is strongly recommend that you use an IAM users instead of the root account for AWS access.
    
    * Set credentials in the AWS credentials profile file on your local system, located at:
    
            ~/.aws/credentials
    * This file should contain lines in the following format:
        ```  
        [Profiles_name]
        aws_access_key_id = <access_key_id>
        aws_secret_access_key =  <secret_key>           
        ```
    * Create an AWS EC2 Key pair pem file and keep it in local.
    * Create an S3 bucket for terraform backend.
    * AMI ID of the linux distribution needed should be obtained from the AWS.

## Providers

AWS.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./modules/ecr | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ./modules/iam | n/a |
| <a name="module_secrets_manager"></a> [secrets\_manager](#module\_secrets\_manager) | ./modules/secrets_manager | n/a |
| <a name="module_webapp_ec2"></a> [webapp\_ec2](#module\_webapp\_ec2) | ./modules/ec2 | n/a |
| <a name="module_webapp_ec2_sg"></a> [webapp\_ec2\_sg](#module\_webapp\_ec2\_sg) | ./modules/ec2_sg | n/a |
| <a name="module_webapp_ip"></a> [webapp\_ip](#module\_webapp\_ip) | ./modules/elastic_ip | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_App_Name"></a> [App\_Name](#input\_App\_Name) | Application Name | `string` | n/a | yes |
| <a name="input_EC2_AMI"></a> [EC2\_AMI](#input\_EC2\_AMI) | AMI name to be used to create the EC2 instance | `string` | n/a | yes |
| <a name="input_EC2_AZ"></a> [EC2\_AZ](#input\_EC2\_AZ) | EC2 AZ's | `string` | `""` | no |
| <a name="input_EC2_INSTANCE_TYPE"></a> [EC2\_INSTANCE\_TYPE](#input\_EC2\_INSTANCE\_TYPE) | Type of Ec2 instance to be created | `string` | `"t2.micro"` | no |
| <a name="input_EC2_PRIVATE_KEY"></a> [EC2\_PRIVATE\_KEY](#input\_EC2\_PRIVATE\_KEY) | SSH private key for EC2 instance | `string` | `""` | no |
| <a name="input_EC2_ROOT_VOLUME_SIZE"></a> [EC2\_ROOT\_VOLUME\_SIZE](#input\_EC2\_ROOT\_VOLUME\_SIZE) | Ec2 Root Volume Size | `number` | `"8"` | no |
| <a name="input_EC2_ROOT_VOLUME_TYPE"></a> [EC2\_ROOT\_VOLUME\_TYPE](#input\_EC2\_ROOT\_VOLUME\_TYPE) | Ec2 Root Volume type | `string` | `"gp2"` | no |
| <a name="input_Env_Type"></a> [Env\_Type](#input\_Env\_Type) | Application Env type | `string` | n/a | yes |
| <a name="input_aws_credentials_file"></a> [aws\_credentials\_file](#input\_aws\_credentials\_file) | AWS credentials file in local | `list(string)` | <pre>[<br>  "~/.aws/credentials"<br>]</pre> | no |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | AWS profile | `string` | `"default"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `"ap-southeast-1"` | no |

## Outputs

No outputs.

## Optione env variables

```
EC2_AZ= "To update the Ec2 instance AZ"
EC2_ROOT_VOLUME_TYPE="To update the Ec2 volume type"
EC2_ROOT_VOLUME_SIZE="To increase the EC2 volume size"
```
## Project setup

* Create terraform backend file *backend.tf* from the given [backend.tf-example](backend.tf-example) file, update the bucket name and other required details.

* Create *terraform.tfvars* from the given [terraform.tfvars-example](terraform.tfvars-example) file.

## Terraform Commands

```
# Terraform Initialize
terraform init

# Terraform Validate
terraform validate

# Terraform Plan
terraform plan

# Terraform Apply
terraform apply

# Clean-Up
terraform destroy
```


# Note: 
Dont push the backend.tf to this template repository.

To setup the project with this clone the project and set the new remote git URL and backend.tf file should be added there.