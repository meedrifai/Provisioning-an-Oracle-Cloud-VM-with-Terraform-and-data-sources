terraform {
  required_version = ">= 1.0"
}

provider "oci" {
  config_file_profile = "DEFAULT"
  region              = var.oci_region
}

