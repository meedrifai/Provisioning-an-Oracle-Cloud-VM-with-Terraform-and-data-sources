resource "oci_core_instance" "web_instance" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  display_name        = "WebInstance"
  shape               = var.vm_shape

  # Configuration pour Flex shapes
  shape_config {
    ocpus         = var.vm_ocpus
    memory_in_gbs = var.vm_memory_in_gbs
  }

  # Source de l'OS (image)
  source_details {
    source_type = "image"
    source_id   = var.image_id
  }

  # Configuration réseau (VNIC)
  create_vnic_details {
    subnet_id        = var.subnet_id
    display_name     = "WebInstanceVNIC"
    assign_public_ip = true
    hostname_label   = "webinstance"
    nsg_ids          = [var.nsg_id]  # ✅ C'est ICI qu'on utilise nsg_ids
  }

  # Métadonnées pour cloud-init
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = base64encode(templatefile("${path.module}/cloud-init.yaml", {
      hostname = "webinstance"
    }))
  }

  # Options de préservation
  preserve_boot_volume = false
}
