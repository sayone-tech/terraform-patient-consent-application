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
