resource null_resource remote-exec {
  depends_on = [oci_mysql_mysql_db_system.export_MySQL1]
  provisioner "file" {
          destination = "/home/opc/wordpress.sh"
          source = "wordpress.sh"

          connection {
          timeout = "15m"
          host = oci_core_public_ip.export_ap01.ip_address
          user = "opc"
          private_key = tls_private_key.key.private_key_pem
          agent = false
          }
      }
  provisioner "file" {
          destination = "/home/opc/nginx.conf"
          source = "nginx.conf"

          connection {
          timeout = "15m"
          host = oci_core_public_ip.export_ap01.ip_address
          user = "opc"
          private_key = tls_private_key.key.private_key_pem
          agent = false
          }
      }
  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "15m"
      host = oci_core_public_ip.export_ap01.ip_address
      user        = "opc"
      private_key = tls_private_key.key.private_key_pem
    }

    inline = [
    "sudo chmod 755 /home/opc/wordpress.sh",
    "/home/opc/wordpress.sh",
    ]
  }
}