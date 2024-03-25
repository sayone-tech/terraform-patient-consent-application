variable "Name" {
  type        = string
  description = "Name of the service"
}


variable "App_Name" {
  type        = string
  description = "Application Name"
}

variable "Env_Type" {
  type        = string
  description = "Application Env type"
}


variable "ECR_ARN" {
  type        = string
  description = "ECR ARN"
}


variable "SECRETSMANAGER_ARN" {
  type        = string
  description = "SECRETSMANAGER ARN"
}
