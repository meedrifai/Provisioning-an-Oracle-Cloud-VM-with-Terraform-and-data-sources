variable "compartment_id" {
  description = "OCI compartment OCID"
  type        = string
}

variable "availability_domain" {
  description = "Availability Domain pour l'instance"
  type        = string
}

variable "subnet_id" {
  description = "ID du subnet où créer l'instance"
  type        = string
}

variable "ssh_public_key" {
  description = "Clé SSH publique pour l'accès à l'instance"
  type        = string
}

variable "image_id" {
  description = "OCID de l'image OS"
  type        = string
}

variable "vm_shape" {
  description = "Shape de la VM"
  type        = string
}

variable "vm_ocpus" {
  description = "Nombre d'OCPUs (pour Flex shapes)"
  type        = number
}

variable "vm_memory_in_gbs" {
  description = "Mémoire en GB (pour Flex shapes)"
  type        = number
}

variable "nsg_id" {
  description = "ID du Network Security Group à attacher"
  type        = string
}
