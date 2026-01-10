output "tenancy_name" {
  description = "Nom du tenancy OCI"
  value       = data.oci_identity_tenancy.current.name
}

output "availability_domains" {
  description = "Liste des Availability Domains du tenancy"
  value       = [for ad in data.oci_identity_availability_domains.ads.availability_domains : ad.name]
}

output "oracle_linux_image_ocid" {
  description = "OCID de l'image Oracle Linux la plus récente"
  value       = data.oci_core_images.oracle_linux.images[0].id
}
