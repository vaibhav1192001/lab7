resource "null_resource" "linux_provisioner" {
  count = var.nb_count
  depends_on = [
    azurerm_linux_virtual_machine.linux_vm
  ]

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]

    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.priv_key)
      host        = azurerm_public_ip.linux_pip[count.index].fqdn
      #host = element(azurerm_linux_virtual_machine.linux_vm[*].public_ip_address, count.index + 1)
      timeout = "10m"
    }
  }
}
