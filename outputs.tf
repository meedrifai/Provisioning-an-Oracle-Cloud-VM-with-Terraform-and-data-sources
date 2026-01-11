# Outputs globaux du projet

output "tenancy_name" {
  description = "Nom du tenancy OCI"
  value       = data.oci_identity_tenancy.current.name
}

output "tenancy_home_region" {
  description = "Région d'origine du tenancy"
  value       = data.oci_identity_tenancy.current.home_region_key
}

output "availability_domain_used" {
  description = "Availability Domain utilisé"
  value       = local.availability_domain
}

# ✅ Protection contre null avec try()
output "oracle_linux_image_id" {
  description = "OCID de l'image Oracle Linux utilisée"
  value       = try(data.oci_core_images.oracle_linux.images[0].id, "Image non trouvée")
}

output "oracle_linux_image_name" {
  description = "Nom de l'image Oracle Linux utilisée"
  value       = try(data.oci_core_images.oracle_linux.images[0].display_name, "Image non trouvée")
}

# Network outputs
output "vcn_id" {
  description = "ID du VCN créé"
  value       = module.network.vcn_id
}

output "public_subnet_id" {
  description = "ID du subnet public"
  value       = module.network.public_subnet_id
}

# Security outputs
output "security_list_id" {
  description = "ID de la Security List"
  value       = module.security.security_list_id
}

output "nsg_id" {
  description = "ID du Network Security Group"
  value       = module.security.nsg_id
}

# Compute outputs
output "instance_id" {
  description = "ID de l'instance compute"
  value       = try(module.compute.instance_id, "Instance non créée")
}

output "instance_public_ip" {
  description = "IP publique de l'instance"
  value       = try(module.compute.instance_public_ip, "IP non disponible")
}

output "instance_private_ip" {
  description = "IP privée de l'instance"
  value       = try(module.compute.instance_private_ip, "IP non disponible")
}
