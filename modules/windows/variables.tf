variable "windows_name" {
  type = map(string)
  default = {
    n01662612-w-vm1 = "Standard_B1s"
  }
}

variable "admin_username" {
  type    = string
  default = "n01662612"
}

variable "admin_password" {
  type    = string
  default = "_z7Urg.?A}DExkp"
}

variable "os_disk" {
  type = object({
    storage_account_type = string
    disk_size            = number
    caching              = string
  })
  default = {
    storage_account_type = "StandardSSD_LRS"
    disk_size            = 128
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
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

variable "windows_avs" {
  type    = string
  default = "windows_avs"
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

variable "common_tags" {
  type = map(string)
}
