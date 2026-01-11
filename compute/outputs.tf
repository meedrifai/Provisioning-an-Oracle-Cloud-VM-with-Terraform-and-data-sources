output "instance_id" {
  description = "OCID de l'instance créée"
  value       = oci_core_instance.web_instance.id
}

output "instance_state" {
  description = "État de l'instance"
  value       = oci_core_instance.web_instance.state
}

output "instance_public_ip" {
  description = "IP publique de l'instance"
  value       = oci_core_instance.web_instance.public_ip
}

output "instance_private_ip" {
  description = "IP privée de l'instance"
  value       = oci_core_instance.web_instance.private_ip
}

output "instance_display_name" {
  description = "Nom de l'instance"
  value       = oci_core_instance.web_instance.display_name
}
