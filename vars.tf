variable region {}
variable compartment_ocid { default = "ocid1.compartment.oc1..aaaaaaaanf3vpw3dxudtgpcdzgcwsne4rytolxifp26ggybnfxngd6agejka" }
variable mysql_shape {
    default = "VM.Standard.E2.1"
}  
variable mysql_password {
    default = "hogeHoge@Hog123"
}
variable ap1_ip_address {
    default = "10.0.0.101"
}
variable mysql_configuration_id {
    type = map
    default = {
        "VM.Standard.E2.1"    = "ocid1.mysqlconfiguration.oc1..aaaaaaaah6o6qu3gdbxnqg6aw56amnosmnaycusttaa7abyq2tdgpgubvsgi"
        "VM.Standard.E2.2"    = "ocid1.mysqlconfiguration.oc1..aaaaaaaah6o6qu3gdbxnqg6aw56amnosmnaycusttaa7abyq2tdgpgubvsgj"
        "VM.Standard.E2.4"    = "ocid1.mysqlconfiguration.oc1..aaaaaaaah6o6qu3gdbxnqg6aw56amnosmnaycusttaa7abyq2tdgpgubvsgk"
        "VM.Standard.E2.8"    = "ocid1.mysqlconfiguration.oc1..aaaaaaaah6o6qu3gdbxnqg6aw56amnosmnaycusttaa7abyq2tdgpgubvsgl"
        "VM.Standard.E3.1.8"  = "ocid1.mysqlconfiguration.oc1..aaaaaaaalwzc2a22xqm56fwjwfymixnulmbq3v77p5v4lcbb6qhkftxf2trq"
        "VM.Standard.E3.1.16" = "ocid1.mysqlconfiguration.oc1..aaaaaaaaweky3hvms4bxw2uyf6pjcoxzf5gkqzxvxmzolgcu6bufd5bjnpyq"
        "VM.Standard.E3.2.32" = "ocid1.mysqlconfiguration.oc1..aaaaaaaakremacvh2fizcznnja5rdxry2q4nyn27afjblyrimzjmrqblhfwa"
        "VM.Standard.E3.4.64" = "ocid1.mysqlconfiguration.oc1..aaaaaaaam2bdlacmi4d2p33wx3aqqx5clnorpokoa6hxezz75rhw46xlj3ka"
        "VM.Standard.E3.8.128"    = "ocid1.mysqlconfiguration.oc1..aaaaaaaa6pxyzjrtsldmu34ynebrvf4ev535qqk4foxqrblnmfr6fym5bm2q"
        "VM.Standard.E3.16.256"   = "ocid1.mysqlconfiguration.oc1..aaaaaaaafbsxowzfzxnnvm5mmmutrfl73hs2cv7ujgs7zqnzzw7v52fvihda"
        "VM.Standard.E3.24.384"   = "ocid1.mysqlconfiguration.oc1..aaaaaaaajeya2xmvgcwjqsuevsmgsry4frwpnfxyfpggkuff2kbh2hh2ugxq"
        "VM.Standard.E3.32.512"   = "ocid1.mysqlconfiguration.oc1..aaaaaaaacmprv4xraedqw3zk6ls6jweiold3gsbtfigxf4xujuwq3nxaqava"
        "VM.Standard.E3.48.768"   = "ocid1.mysqlconfiguration.oc1..aaaaaaaaep75r2j453khbhuq7kfmxnefskx4wdw5he4r7rnr75fvkrtzkf6q"
        "VM.Standard.E3.64.1024"  = "ocid1.mysqlconfiguration.oc1..aaaaaaaalic45e2gauld2mwdpppzydow2sfkpcvecbfizkvgkhupezoi7oja"
        "BM.Standard.E2.64"   = "ocid1.mysqlconfiguration.oc1..aaaaaaaah6o6qu3gdbxnqg6aw56amnosmnaycusttaa7abyq2tdgpgubvsgh"
    }
}

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
