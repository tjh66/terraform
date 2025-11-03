variable "ecc_rg_name"{
type = string
description = "Name of Existing Resource Group"
}
variable "ecc_rg_loc"{
type = string
description = "Location of Resource Group "
default = "UK South"
}
variable "ecc_vm_subnet_name"{
type = string
description = "Name of existing subnet to attach vm nic"
}
variable "ecc_vm_vnet_name"{
type = string
description = "Name of existing vNet that subnet is associated to"
}
variable "ecc_vm_vnet_rg"{
type = string
description = "Name of existing vNet Resource Group"
}
variable "ecc_vm_server_sku"{
type=string
description = "Server SKU for example 2019-Datacenter"
default = "2019-datacenter-gensecond"
}
variable "ecc_vm_server_publisher"{
type=string
description = "Server publisher for example MicrosoftWindowsServer"
default = "MicrosoftWindowsServer"
}
variable "ecc_vm_server_offer"{
type=string
description = "Server offer for example WindowsServer"
default = "WindowsServer"
}
variable "ecc_vm_server_version"{
type=string
description = "Server image version for example latest"
default = "latest"
}
variable "ecc_vm_name"{
type = string
description = "Virtual machine Name"
}
variable "ecc_vm_pw"{
type = string
description = "Virtual Machine Password"
}
variable "ecc_vm_size"{
type = string
description = "Virtual machine Size"
default = "Standard_B2ms"
}
variable "ecc_vm_storage_type" {
type    = string
description = "VM Storage Account Type for Managed Disks (Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS)  "
default = "Premium_LRS"
}
variable "ecc_patch_grp"{
type = string
description = "Virtual machine PatchGroup"
default = "3rd Tuesday"
}
variable "ecc_patch_mode"{
type = string
description = "Virtual machine Patch mode either Manual, AutomaticByOS and AutomaticByPlatform"
default = "Manual"
}
variable "ecc_pw_join_dom"{
type = string
description = "Domain Join Password"
}

