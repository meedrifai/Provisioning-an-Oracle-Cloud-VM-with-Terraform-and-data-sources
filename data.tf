# Récupération des informations du tenancy
data "oci_identity_tenancy" "current" {
  tenancy_id = var.tenancy_id
}

# Récupération de tous les Availability Domains
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_id
}

# Récupération de l'image Oracle Linux ARM pour la région configurée
data "oci_core_images" "oracle_linux" {
  compartment_id           = var.compartment_id
  operating_system         = var.oracle_linux_os
  operating_system_version = "8"
  shape                    = var.vm_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

# Utilise directement la variable
locals {
  availability_domain = var.availability_domain_name
}
