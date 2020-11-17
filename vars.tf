variable region {}
variable compartment_ocid { default = "ocid1.compartment.oc1..aaaaaaaanf3vpw3dxudtgpcdzgcwsne4rytolxifp26ggybnfxngd6agejka" }
variable export_ap1_source_image_id {
 type = map
 default = {
    us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaaxdnx3den32vwplngpeu44zakw7lxup7vcdd3jmke4pfleaug3m6q"
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaaf2wxqc6ee5axabpbandk6ji27oyxyicatqw5iwkrk76kecqrrdyq"
    ca-toronto-1   = "ocid1.image.oc1.ca-toronto-1.aaaaaaaadsv6are52igmc63fe7xkdtj22uqqzibkps6ukhupac6dwuiqby4a" 
    ap-tokyo-1     = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaazgoy6klsxzbi5jh5kx2qwxw6l6mqtlbo4c4kak4zes7zwytd4z2q"
    ap-osaka-1     = "ocid1.image.oc1.ap-osaka-1.aaaaaaaahfv5tiogcrhesqedn7bfp2bm65eszn47bv6fgsepenscf2bz4bga"
    ap-seoul-1     = "ocid1.image.oc1.ap-seoul-1.aaaaaaaa5df7nz7fgtiqfbnx2fyefgsqvr5z7me4g2snwwmhgiwxgs5iozsq"
    }
 }
variable sg_dest_name {
    type = map
    default = {
        us-phoenix-1 = "oci-phx-objectstorage"
        us-ashburn-1 = "oci-iad-objectstorage"
        ca-toronto-1 = "oci-yyz-objectstorage"
        ap-osaka-1 = "oci-kix-objectstorage"
        ap-tokyo-1 = "oci-nrt-objectstorage"
        ap-seoul-1 = "oci-icn-objectstorage"
    }
}
variable ap1_ip_address {
    default = "10.0.0.101"
}
variable mysql_configuration_id {
    default = "ocid1.mysqlconfiguration.oc1..aaaaaaaah6o6qu3gdbxnqg6aw56amnosmnaycusttaa7abyq2tdgpgubvsgi"
}
variable mysql_password {
    default = "hogeHoge@Hog123"
}

variable mysql_shape {
    default = "VM.Standard.E2.1"
}