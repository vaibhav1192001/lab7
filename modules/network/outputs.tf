output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet1_name" {
  value = azurerm_subnet.subnet1.name
}

output "subnet1_address_prefix" {
  value = azurerm_subnet.subnet1.address_prefixes[0]
}

output "subnet2_name" {
  value = azurerm_subnet.subnet2.name
}

output "subnet2_address_prefix" {
  value = azurerm_subnet.subnet2.address_prefixes[0]
}

output "nsg1_name" {
  value = azurerm_network_security_group.nsg1.name
}

output "nsg2_name" {
  value = azurerm_network_security_group.nsg2.name
}
output "subnet1_id" {
  value = azurerm_subnet.subnet1.id
}
output "subnet2_id" {
  value = azurerm_subnet.subnet2.id
}

output "subnet1_nsg_id" {
  value = azurerm_subnet_network_security_group_association.subnet1_nsg.id
}

output "subnet2_nsg_id" {
  value = azurerm_subnet_network_security_group_association.subnet2_nsg.id
}
