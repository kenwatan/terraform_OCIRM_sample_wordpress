resource oci_core_internet_gateway export_IG1 {
  compartment_id = var.compartment_ocid
  display_name = "IG1"
  enabled      = "true"
  vcn_id = oci_core_vcn.export_vcn1.id
}
resource oci_core_network_security_group export_Network-Security-Group-for-AP {
  compartment_id = var.compartment_ocid
  display_name = "Network Security Group for AP"
  vcn_id = oci_core_vcn.export_vcn1.id
}
resource oci_core_network_security_group_security_rule export_Network-Security-Group-for-AP_network_security_group_security_rule_1 {
  destination_type          = ""
  direction                 = "INGRESS"
  network_security_group_id = oci_core_network_security_group.export_Network-Security-Group-for-AP.id
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = "80"
      min = "80"
    }
  }
}
resource oci_core_service_gateway export_SG1 {
  compartment_id = var.compartment_ocid
  display_name = "SG1"
  services {
    service_id = data.oci_core_services.test_services.services.0.id
  #  service_id = var.sg_ocid_map[var.region]
  }
  vcn_id = oci_core_vcn.export_vcn1.id
}
resource oci_core_subnet export_PrivateSubnet {
  cidr_block     = "10.0.1.0/24"
  compartment_id = var.compartment_ocid
  dhcp_options_id = oci_core_vcn.export_vcn1.default_dhcp_options_id
  display_name    = "PrivateSubnet"
  dns_label       = "privatesubnet"
  prohibit_public_ip_on_vnic = "true"
  route_table_id             = oci_core_route_table.export_PrivateSubnetRoute.id
  security_list_ids = [
    oci_core_security_list.export_Security-List-for-PrivateSubnet.id,
  ]
  vcn_id = oci_core_vcn.export_vcn1.id
}
resource oci_core_subnet export_PublicSubnet {
  cidr_block     = "10.0.0.0/24"
  compartment_id = var.compartment_ocid
  dhcp_options_id = oci_core_vcn.export_vcn1.default_dhcp_options_id
  display_name    = "PublicSubnet"
  dns_label       = "publicsubnet"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_vcn.export_vcn1.default_route_table_id
  security_list_ids = [
    oci_core_vcn.export_vcn1.default_security_list_id,
  ]
  vcn_id = oci_core_vcn.export_vcn1.id
}
resource oci_core_vcn export_vcn1 {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.compartment_ocid
  display_name = "vcn1"
  dns_label    = "vcn1"
}
resource oci_core_nat_gateway export_NG1 {
  block_traffic  = "false"
  compartment_id = var.compartment_ocid
  display_name = "NG1"
  vcn_id       = oci_core_vcn.export_vcn1.id
}
resource oci_core_route_table export_PrivateSubnetRoute {
  compartment_id = var.compartment_ocid
  display_name = "PrivateSubnetRoute"
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.export_NG1.id
  }
  route_rules {
    destination       = var.sg_dest_name[var.region]
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.export_SG1.id
  }
  vcn_id = oci_core_vcn.export_vcn1.id
}
resource oci_core_default_route_table export_Default-Route-Table-for-vcn1 {
  display_name = "Default Route Table for vcn1"
  freeform_tags = {
  }
  manage_default_resource_id = oci_core_vcn.export_vcn1.default_route_table_id
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.export_IG1.id
  }
}
resource oci_core_security_list export_Security-List-for-PrivateSubnet {
  compartment_id = var.compartment_ocid
  display_name = "Security List for PrivateSubnet"
  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol  = "all"
    stateless = "false"
  }
  ingress_security_rules {
    protocol    = "6"
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "3306"
      min = "3306"
    }
  }
  ingress_security_rules {
    protocol    = "6"
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "33060"
      min = "33060"
    }
  }
  vcn_id = oci_core_vcn.export_vcn1.id
}
resource oci_core_default_security_list export_Default-Security-List-for-vcn1 {
  display_name = "Default Security List for vcn1"
  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol  = "all"
    stateless = "false"
  }
  ingress_security_rules {
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
    }
  }
  ingress_security_rules {
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }
  ingress_security_rules {
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }
  ingress_security_rules {
    protocol    = "6"
    source      = "10.0.0.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "80"
      min = "80"
    }
  }
  manage_default_resource_id = oci_core_vcn.export_vcn1.default_security_list_id
}
