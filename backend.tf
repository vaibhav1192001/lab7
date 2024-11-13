terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01662612RG"
    storage_account_name = "tfstaten01662612sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"

  }

}
