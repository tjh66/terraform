

variable "ecc_avail_set" {
type = string
description = "If you don't need to associate this vm to an availabilty set please leave blank and it will skip this configuration"
default = ""
}

variable "ecc_avail_zone" {
type = string
description = "If you don't need to associate this vm to an availabilty zone please leave blank and it will skip this configuration allowed valuse are 1, 2 or 3"
default = ""
}

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
variable "ecc_existing_as"{
type = string
description = "Name of existing AvailabiltySet"
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
variable "ecc_vm_ip"{
type = string
description = "Virtual machine IP Address"
}
variable "ecc_vm_storage_type" {
  type    = string
  description = "VM Storage Account Type for Managed Disks (Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS)  "
  default = "Premium_LRS"
}
variable "ecc_patch_grp"{
type = string
description = "Virtual machine PatchGroup"
default = "7 Days after Patch Tuesday"
}
variable "ecc_patch_mode"{
type = string
description = "Virtual machine Patch mode either Manual, AutomaticByOS and AutomaticByPlatform"
default = "AutomaticByPlatform"
}
variable "ecc_patch_method"{
type = string
description = "Virtual machine Patch Method default is Azure Update Manager"
default = "Azure Update Manager"
}

variable "ecc_automatic_updates"{
type=string
description = "Specifies if Automatic Updates are Enabled for the Windows Virtual Machine default is true"
default = "true"
}
variable "ecc_bypass_platform_safety_checks"{
type = string
description = "Specifies whether to skip platform scheduled patching when a user schedule is associated with the VM default is true"
default = "true"
}
variable "ecc_azurerm_dev_test_global_vm_shutdown_schedule" {
type = bool
description = "Does this VM need to shut down on a daily basis time zone is default to UTC and powerdown is 19:00 this can be changed after deployment values are true or false."
}
variable "ecc_tags" {
  description = "A mapping of tags which should be assigned to the Resource Group you can add or remove tags just follow the format remember please update anything that has a value of Default."
  type        = map(string)
  default     = {"Agreement" : "EA", "BaseService" : "No","CostCentre" : "CITS9200","Description" : "Default","ServiceName" : "Default","ServiceOwner" : "Default","TSSupportingTeam" : "Platform and Infrastructure"}
}