# Network Security Group (équivalent AWS Security Groups)
resource "oci_core_network_security_group" "web_nsg" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "WebNSG"
}

# Règle NSG: Allow SSH
resource "oci_core_network_security_group_security_rule" "nsg_rule_ssh" {
  network_security_group_id = oci_core_network_security_group.web_nsg.id
  direction                 = "INGRESS"
  protocol                  = "6"  # TCP
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  description               = "Allow SSH"

  tcp_options {
    destination_port_range {
      min = 22
      max = 22
    }
  }
}

# Règle NSG: Allow HTTP
resource "oci_core_network_security_group_security_rule" "nsg_rule_http" {
  network_security_group_id = oci_core_network_security_group.web_nsg.id
  direction                 = "INGRESS"
  protocol                  = "6"  # TCP
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  description               = "Allow HTTP"

  tcp_options {
    destination_port_range {
      min = 80
      max = 80
    }
  }
}

# Règle NSG: Allow HTTPS
resource "oci_core_network_security_group_security_rule" "nsg_rule_https" {
  network_security_group_id = oci_core_network_security_group.web_nsg.id
  direction                 = "INGRESS"
  protocol                  = "6"  # TCP
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  description               = "Allow HTTPS"

  tcp_options {
    destination_port_range {
      min = 443
      max = 443
    }
  }
}

# Règle NSG: Allow all outbound
resource "oci_core_network_security_group_security_rule" "nsg_rule_egress" {
  network_security_group_id = oci_core_network_security_group.web_nsg.id
  direction                 = "EGRESS"
  protocol                  = "all"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
  description               = "Allow all outbound"
}
