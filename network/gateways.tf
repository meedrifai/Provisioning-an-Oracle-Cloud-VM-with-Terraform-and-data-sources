# Internet Gateway pour le subnet public
resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.main_vcn.id
  display_name   = "MainIGW"
  enabled        = true
}

# NAT Gateway pour le subnet privé (optionnel)
resource "oci_core_nat_gateway" "nat_gw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.main_vcn.id
  display_name   = "MainNATGateway"
}

# Service Gateway pour accès aux services OCI (optionnel)
data "oci_core_services" "all_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}

resource "oci_core_service_gateway" "service_gw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.main_vcn.id
  display_name   = "MainServiceGateway"

  services {
    service_id = data.oci_core_services.all_services.services[0].id
  }
}
