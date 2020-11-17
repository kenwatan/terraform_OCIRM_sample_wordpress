data oci_core_vnic_attachments instance1_vnics {
  availability_domain = data.oci_identity_availability_domain.export_TGjA-AD-1.name
  compartment_id      = var.compartment_ocid
  instance_id         = oci_core_instance.export_ap1.id
}

data oci_core_vnic instance1_primary_vnic {
    vnic_id = data.oci_core_vnic_attachments.instance1_vnics.vnic_attachments[0].vnic_id
}

data oci_core_private_ips instance1_ip {
    vnic_id = data.oci_core_vnic.instance1_primary_vnic.id
}

data oci_core_services test_services {
}
