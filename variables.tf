# Variables globales pour le projet OCI

variable "oci_region" {
  description = "Région OCI pour toutes les ressources"
  type        = string
  default     = "eu-paris-1"
}

variable "compartment_id" {
  description = "Compartment OCID pour créer les ressources"
  type        = string
}

variable "tenancy_id" {
  description = "OCID du tenancy OCI"
  type        = string
}

variable "availability_domain_name" {
  description = "Nom de l'Availability Domain (ex: uFVI:EU-PARIS-1-AD-1)"
  type        = string
}

variable "vcn_cidr" {
  description = "CIDR block pour le VCN principal"
  type        = string
  default     = "10.0.0.0/16"
}

variable "oracle_linux_image_id" {
  description = "OCID de l'image Oracle Linux à utiliser (optionnel, sinon data source)"
  type        = string
  default     = ""
}
variable "public_subnet_cidr" {
  description = "CIDR block pour le subnet public"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block pour le subnet privé"
  type        = string
  default     = "10.0.2.0/24"
}

variable "oracle_linux_os" {
  description = "Système d'exploitation pour l'image de la VM"
  type        = string
  default     = "Oracle Linux"
}

variable "ssh_public_key_path" {
  description = "Chemin vers la clé SSH publique pour la VM"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "vm_shape" {
  description = "Shape de la VM (ex: VM.Standard.E4.Flex)"
  type        = string
  default     = "VM.Standard.E4.Flex"
}

variable "vm_ocpus" {
  description = "Nombre d'OCPUs pour la VM Flex"
  type        = number
  default     = 1
}

variable "vm_memory_in_gbs" {
  description = "Mémoire en GB pour la VM Flex"
  type        = number
  default     = 6
}
