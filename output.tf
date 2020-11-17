output "PublicIP" {
  value = oci_core_public_ip.export_ap01.ip_address
}
output "LBIP" {
  value = oci_core_public_ip.export_lb01.ip_address
}
output "Private_key" {
  value = tls_private_key.key.private_key_pem
}

