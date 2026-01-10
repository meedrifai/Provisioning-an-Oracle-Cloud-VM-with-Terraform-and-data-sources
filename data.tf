# Tenancy info
data "oci_identity_tenancy" "current" {
  tenancy_id = var.tenancy_id
}

# Availability Domains
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

# Compartments (pour la VM)
data "oci_identity_compartments" "compartments" {
  compartment_id = var.compartment_id
  filter {
    name   = "compartment_type"
    values = ["COMPARTMENT"]
  }
}

# Oracle Linux image
data "oci_core_images" "oracle_linux" {
  compartment_id   = var.compartment_id
  operating_system = var.oracle_linux_os
  sort_by          = "TIMECREATED"
  sort_order       = "DESC"
}

