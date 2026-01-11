output "security_list_id" {
  description = "ID de la Security List publique"
  value       = oci_core_security_list.public_security_list.id
}

output "nsg_id" {
  description = "ID du Network Security Group"
  value       = oci_core_network_security_group.web_nsg.id
}
