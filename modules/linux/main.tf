resource "azurerm_availability_set" "linux_avset" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = var.rg_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true
  tags                         = var.common_tags
}

resource "azurerm_public_ip" "linux_pip" {
  count               = var.nb_count
  name                = "${var.linux_name}-pip-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.linux_name}${format("%1d", count.index + 1)}"
  tags                = var.common_tags
}

resource "azurerm_network_interface" "linux_nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.common_tags

  ip_configuration {
    name                          = "${var.linux_name}-nic-${format("%1d", count.index + 1)}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_pip[count.index].id
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  count                 = var.nb_count
  name                  = "${var.linux_name}${format("%1d", count.index + 1)}"
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.linux_nic[count.index].id]
  size                  = var.linux_size
  availability_set_id   = azurerm_availability_set.linux_avset.id
  computer_name         = "${var.linux_name}${format("%1d", count.index + 1)}"
  admin_username        = var.admin_username
  tags                  = var.common_tags

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${var.linux_name}${format("%1d", count.index + 1)}-os-disk"
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
}
