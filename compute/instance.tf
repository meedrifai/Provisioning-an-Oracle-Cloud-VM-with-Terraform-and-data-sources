resource "oci_core_instance" "web_instance" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  display_name        = "WebInstance"
  shape               = var.vm_shape

  # ✅ shape_config SEULEMENT pour Flex shapes
  dynamic "shape_config" {
    for_each = length(regexall("Flex", var.vm_shape)) > 0 ? [1] : []
    content {
      ocpus         = var.vm_ocpus
      memory_in_gbs = var.vm_memory_in_gbs
    }
  }

  source_details {
    source_type = "image"
    source_id   = var.image_id
  }

  create_vnic_details {
    subnet_id        = var.subnet_id
    display_name     = "WebInstanceVNIC"
    assign_public_ip = true
    hostname_label   = "webinstance"
    nsg_ids          = [var.nsg_id]
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = base64encode(templatefile("${path.module}/cloud-init.yaml", {
      hostname = "webinstance"
    }))
  }

  preserve_boot_volume = false
}
