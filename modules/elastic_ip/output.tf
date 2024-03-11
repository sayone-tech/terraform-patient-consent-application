output "Elastic_Private_IP" {
  value = aws_eip.eip.private_ip
}

output "Elastic_Public_IP" {
  value = aws_eip.eip.public_ip
}