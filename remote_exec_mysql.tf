resource null_resource remote-exec_mysql {
  depends_on = [null_resource.remote-exec]
  provisioner "file" {
          destination = "/home/opc/.my.cnf"
          source = "my.cnf"

          connection {
          timeout = "15m"
          host = oci_core_public_ip.export_ap01.ip_address
          user = "opc"
          private_key = tls_private_key.key.private_key_pem
          agent = false
          }
      }
  provisioner "file" {
          destination = "/home/opc/mysql.sql"
          source = "mysql.sql"

          connection {
          timeout = "15m"
          host = oci_core_public_ip.export_ap01.ip_address
          user = "opc"
          private_key = tls_private_key.key.private_key_pem
          agent = false
          }
      }
  provisioner "file" {
          destination = "/home/opc/mysql.sh"
          source = "mysql.sh"

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
    "sudo chmod 755 /home/opc/mysql.sh",
    "/home/opc/mysql.sh",
    ]
  }
}