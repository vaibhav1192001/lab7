resource "azurerm_resource_group" "network" {
  name     = var.rg_network
  location = var.location
}

resource "azurerm_resource_group" "linux" {
  name     = var.rg_linux
  location = var.location
}

resource "azurerm_resource_group" "windows" {
  name     = var.rg_windows
  location = var.location
}
