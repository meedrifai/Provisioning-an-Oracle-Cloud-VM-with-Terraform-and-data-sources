variable "compartment_id" {
  description = "OCI compartment OCID"
  type        = string
}

variable "vcn_id" {
  description = "ID du VCN auquel attacher la security"
  type        = string
}

variable "vcn_cidr" {
  description = "CIDR du VCN pour les règles internes"
  type        = string
}
