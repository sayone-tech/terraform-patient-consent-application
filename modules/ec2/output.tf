output "EC2_INSTANCE_ID" {
  description = "EC2 INSTANCE ID"
  value       = aws_instance.app_server.id
}