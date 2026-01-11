variable "compartment_id" {
  description = "OCI compartment OCID"
  type        = string
}

variable "vcn_cidr" {
  description = "CIDR block pour le VCN"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block pour le subnet public"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block pour le subnet privé"
  type        = string
}

variable "availability_domain" {
  description = "Availability Domain pour les subnets"
  type        = string
}

