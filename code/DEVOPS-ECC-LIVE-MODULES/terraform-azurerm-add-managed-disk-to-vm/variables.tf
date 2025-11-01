variable "ecc_rg_name"{
type = string
description = "Name of Resource Group or Existing Resource Group"
}
variable "ecc_rg_loc"{
type = string
description = "Location of Resource Group or Existing Resource Group"
default = "UK South"
}
variable "ecc_vm_name"{
type = string
description = "Name of Existing VM to attached disk to"
}
variable "ecc_vm_disk_size"{
type = string
description = "Disk Size in GiB"
default = "128"
}
variable "ecc_vm_disk_type"{
type = string
description = "Disk Type (Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS)"
default = "Premium_LRS"
}
variable "ecc_vm_disk_lun"{
type = string
description = "New Disk LUN Number"
}
variable "ecc_vm_disk_cache"{
type = string
description = "Disk Cache"
default = "ReadOnly"
}
variable "ecc_vm_disk_label"{
type = string
description = "Disk Label"
default = "data"
}