resource "oci_core_virtual_network" "main_vcn" {
  compartment_id = var.compartment_id
  display_name   = "MainVCN"
  cidr_block     = var.vcn_cidr
  dns_label      = "mainvcn"
}
