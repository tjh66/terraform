variable "ecc_rg_name"{
type = string
description = "Name of Existing Resource Group"
}
variable "ecc_rg_loc"{
type = string
description = "Location of Existing Resource Group"
default = "UK South"
}
variable "ecc_subnet_name"{
type = string
description = "Name of existing subnet"
}
variable "ecc_vnet_name"{
type = string
description = "Name of existing vnet that the subnet is associated to"
}
variable "ecc_vnet_rg_name"{
type = string
description = "Name of existing vnet resource group that the subnet is associated to"
}
variable "ecc_new_nsg_name"{
type = string
description = "Name of new NSG suffix -nsg will automatically be added to the end"
}