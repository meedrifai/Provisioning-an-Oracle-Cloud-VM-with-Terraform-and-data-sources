# Security List pour le subnet public
resource "oci_core_security_list" "public_security_list" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "PublicSecurityList"

  # Règles Ingress (entrantes)
  ingress_security_rules {
    protocol    = "6"  # TCP
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    description = "Allow SSH from anywhere"

    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol    = "6"  # TCP
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    description = "Allow HTTP"

    tcp_options {
      min = 80
      max = 80
    }
  }

  ingress_security_rules {
    protocol    = "6"  # TCP
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    description = "Allow HTTPS"

    tcp_options {
      min = 443
      max = 443
    }
  }

  ingress_security_rules {
    protocol    = "1"  # ICMP
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    description = "Allow ICMP (ping)"

    icmp_options {
      type = 8  # Echo request
    }
  }

  # Règles Egress (sortantes)
  egress_security_rules {
    protocol         = "all"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    description      = "Allow all outbound traffic"
  }
}
