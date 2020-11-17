resource oci_core_public_ip export_ap01 {
  compartment_id = var.compartment_ocid
  display_name = "ap01"
  lifetime      = "RESERVED"
  private_ip_id = data.oci_core_private_ips.instance1_ip.private_ips[0].id
}
resource oci_core_public_ip export_ap02 {
  compartment_id = var.compartment_ocid
  display_name = "ap02"
  lifetime = "RESERVED"
}

resource oci_core_public_ip export_lb01 {
  compartment_id = var.compartment_ocid
  display_name = "lb01"
  lifetime = "RESERVED"
}
