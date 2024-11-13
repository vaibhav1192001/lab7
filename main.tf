module "resource_group" {
  source     = "./modules/resource_group"
  rg_network = "network-rg"
  rg_linux   = "linux-rg"
  rg_windows = "windows-rg"
  location   = "canadacentral"
}

module "network" {
  source         = "./modules/network"
  vnet_name      = "vnet"
  address_space  = "10.0.0.0/16"
  subnet1_name   = "subnet1"
  subnet1_prefix = "10.0.1.0/24"
  subnet2_name   = "subnet2"
  subnet2_prefix = "10.0.2.0/24"
  nsg1_name      = "nsg1"
  nsg2_name      = "nsg2"
  location       = module.resource_group.location
  rg_name        = module.resource_group.rg_network_name
}

module "linux" {
  source         = "./modules/linux"
  nb_count       = 2
  linux_name     = "n01662612-c-vm"
  linux_size     = "Standard_B1s"
  admin_username = "n01662612"
  public_key     = "/home/n01662612/.ssh/id_rsa.pub"
  priv_key       = "/home/n01662612/.ssh/id_rsa"
  location       = module.resource_group.location
  rg_name        = module.resource_group.rg_linux_name
  subnet_id      = module.network.subnet1_id
  common_tags    = local.common_tags

  os_info = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_5"
    version   = "latest"
  }

}

module "windows" {
  source = "./modules/windows"
  windows_name = {
    n01662612-w-vm1 = "Standard_B1s"
  }
  admin_username = "winadm"
  admin_password = "Winadm!23"
  location       = module.resource_group.location
  rg_name        = module.resource_group.rg_windows_name
  subnet_id      = module.network.subnet2_id
  common_tags    = local.common_tags
}

locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n01662612@humber.ca"
    Environment  = "Lab"
  }

  os_info = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

}
