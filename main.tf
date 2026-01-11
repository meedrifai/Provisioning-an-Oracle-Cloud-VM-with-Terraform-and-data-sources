locals {
  ssh_public_key_path_expanded = replace(var.ssh_public_key_path, "~", pathexpand("~"))
}

# Module Network
module "network" {
  source = "./network"

  compartment_id          = var.compartment_id
  vcn_cidr                = var.vcn_cidr
  public_subnet_cidr      = var.public_subnet_cidr
  private_subnet_cidr     = var.private_subnet_cidr
  availability_domain     = local.availability_domain
}

# Module Security
module "security" {
  source = "./security"

  compartment_id = var.compartment_id
  vcn_id         = module.network.vcn_id
  vcn_cidr       = var.vcn_cidr
}

# Module Compute
module "compute" {
  source = "./compute"

  compartment_id      = var.compartment_id
  availability_domain = local.availability_domain
  subnet_id           = module.network.public_subnet_id
  ssh_public_key      = file(local.ssh_public_key_path_expanded)
  image_id            = var.oracle_linux_image_id != "" ? var.oracle_linux_image_id : try(data.oci_core_images.oracle_linux.images[0].id, null)
  vm_shape            = var.vm_shape
  vm_ocpus            = var.vm_ocpus
  vm_memory_in_gbs    = var.vm_memory_in_gbs
  nsg_id              = module.security.nsg_id
}
