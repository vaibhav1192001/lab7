output "windows_vm_hostnames" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].name
}

output "windows_vm_fqdns" {
  value = values(azurerm_public_ip.windows_public_ip)[*].fqdn
}

output "windows_vm_private_ips" {
  value = values(azurerm_network_interface.windows_nic)[*].private_ip_address
}

output "windows_vm_public_ips" {
  value = values(azurerm_public_ip.windows_public_ip)[*].ip_address
}

output "windows_avs_name" {
  value = azurerm_availability_set.windows_avset.name
}
