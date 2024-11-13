variable "linux_name" {
  type    = string
  default = "n01662612-c-vm"
}

variable "linux_size" {
  type    = string
  default = "Standard_B1s"
}

variable "admin_username" {
  type    = string
  default = "n01662612"
}

variable "public_key" {
  type    = string
  default = "/home/n01662612/.ssh/id_rsa.pub"
}

variable "priv_key" {
  type    = string
  default = "/home/n01662612/.ssh/id_rsa"
}

variable "os_disk" {
  type = object({
    storage_account_type = string
    disk_size            = number
    caching              = string
  })
  default = {
    storage_account_type = "Premium_LRS"
    disk_size            = 32
    caching              = "ReadWrite"
  }
}

variable "os_info" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_5"
    version   = "latest"
  }
}

variable "common_tags" {
  type = map(string)
}

variable "linux_avs" {
  type    = string
  default = "linux_avs"
}

variable "nb_count" {
  type    = number
  default = 2
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "subnet_id" {
  type = string
}
