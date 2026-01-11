# Subnet public
resource "oci_core_subnet" "public_subnet" {
  compartment_id             = var.compartment_id
  vcn_id                     = oci_core_virtual_network.main_vcn.id
  display_name               = "PublicSubnet"
  cidr_block                 = var.public_subnet_cidr
  availability_domain        = var.availability_domain
  route_table_id             = oci_core_route_table.public_rt.id
  security_list_ids          = [oci_core_virtual_network.main_vcn.default_security_list_id]
  prohibit_public_ip_on_vnic = false
  dns_label                  = "public"
}

# Subnet privé
resource "oci_core_subnet" "private_subnet" {
  compartment_id             = var.compartment_id
  vcn_id                     = oci_core_virtual_network.main_vcn.id
  display_name               = "PrivateSubnet"
  cidr_block                 = var.private_subnet_cidr
  availability_domain        = var.availability_domain
  route_table_id             = oci_core_route_table.private_rt.id
  security_list_ids          = [oci_core_virtual_network.main_vcn.default_security_list_id]
  prohibit_public_ip_on_vnic = true
  dns_label                  = "private"
}
