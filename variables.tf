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

variable "oracle_linux_os" {
  description = "Système d'exploitation pour l'image de la VM"
  type        = string
  default     = "Oracle Linux"
}

variable "tenancy_id" {
  description = "OCID du tenancy OCI"
  type        = string
}
