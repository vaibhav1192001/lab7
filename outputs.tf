output "rg_network_name" {
  description = "This is network resource group"
  value       = module.resource_group.rg_network_name
}

output "rg_linux_name" {
  description = "This is linux vm resource group"
  value       = module.resource_group.rg_linux_name
}

output "rg_windows_name" {
  description = "This is windows vm resource group"
  value       = module.resource_group.rg_windows_name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "vnet_address_space" {
  value = module.network.vnet_address_space
}

output "subnet1_name" {
  value = module.network.subnet1_name
}

output "subnet1_address_prefix" {
  value = module.network.subnet1_address_prefix
}

output "subnet2_name" {
  value = module.network.subnet2_name
}

output "subnet2_address_prefix" {
  value = module.network.subnet2_address_prefix
}

output "nsg1_name" {
  value = module.network.nsg1_name
}

output "nsg2_name" {
  value = module.network.nsg2_name
}

output "subnet1_nsg_association" {
  value = module.network.subnet1_nsg_id
}

output "subnet2_nsg_association" {
  value = module.network.subnet2_nsg_id
}

output "linux_vm_hostnames" {
  value = module.linux.linux_vm_hostnames
}

output "linux_vm_fqdns" {
  value = module.linux.linux_vm_fqdns
}

output "linux_vm_private_ips" {
  value = module.linux.linux_vm_private_ips
}

output "linux_vm_public_ips" {
  value = module.linux.linux_vm_public_ips
}

output "linux_avs_name" {
  value = module.linux.linux_avs_name
}
output "windows_vm_hostnames" {
  value = module.windows.windows_vm_hostnames
}

output "windows_vm_fqdns" {
  value = module.windows.windows_vm_fqdns
}

output "windows_vm_private_ips" {
  value = module.windows.windows_vm_private_ips
}

output "windows_vm_public_ips" {
  value = module.windows.windows_vm_public_ips
}

output "windows_avs_name" {
  value = module.windows.windows_avs_name
}
