resource "azurerm_availability_set" "windows_avset" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = var.rg_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true
  tags                         = var.common_tags
}

resource "azurerm_public_ip" "windows_public_ip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
  domain_name_label   = lower(each.key)
  tags                = var.common_tags
}

resource "azurerm_network_interface" "windows_nic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.common_tags

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_public_ip[each.key].id
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  for_each              = var.windows_name
  name                  = each.key
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.windows_nic[each.key].id]
  size                  = each.value
  availability_set_id   = azurerm_availability_set.windows_avset.id
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  tags                  = var.common_tags

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
    disk_size_gb         = var.os_disk.disk_size
  }

  source_image_reference {
    publisher = var.os_info.publisher
    offer     = var.os_info.offer
    sku       = var.os_info.sku
    version   = var.os_info.version
  }

  winrm_listener {
    protocol = "Http"
  }
}
