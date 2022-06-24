output "dns_publica" {
  description = "DNS pública del servidor"
  value       = "http://${aws_instance.mi_servidor.public_dns}:8080"
}

output "ipv4_servidor" {
  description = "IPv4 de nuestro servidor"
  value       = "http://${aws_instance.mi_servidor.public_ip}:8080"
}
