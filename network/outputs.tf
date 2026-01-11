output "vcn_id" {
  description = "ID du VCN créé"
  value       = oci_core_virtual_network.main_vcn.id
}

output "vcn_cidr" {
  description = "CIDR du VCN"
  value       = oci_core_virtual_network.main_vcn.cidr_block
}

output "public_subnet_id" {
  description = "ID du subnet public"
  value       = oci_core_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "ID du subnet privé"
  value       = oci_core_subnet.private_subnet.id
}

output "internet_gateway_id" {
  description = "ID de l'Internet Gateway"
  value       = oci_core_internet_gateway.igw.id
}

output "nat_gateway_id" {
  description = "ID du NAT Gateway"
  value       = oci_core_nat_gateway.nat_gw.id
}

output "service_gateway_id" {
  description = "ID du Service Gateway"
  value       = oci_core_service_gateway.service_gw.id
}

output "public_route_table_id" {
  description = "ID de la route table publique"
  value       = oci_core_route_table.public_rt.id
}

output "private_route_table_id" {
  description = "ID de la route table privée"
  value       = oci_core_route_table.private_rt.id
}
