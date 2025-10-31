variable "ecc_location"{
type = string
description = "Region of workspace to be deployed"
}
variable "ecc_rg_name"{
type = string
description = "Name of existing Resource Group"
}
variable "ecc_azurerm_ai_services"{
type = string
description = "Name of Foundry Instance"
}
variable "ecc_azurerm_ai_services_sku"{
type = string
description = "SKU of Foundry Instance default S0"
default = "S0"
}
variable "ecc_public_network_access"{
type = string
description = "Enable/Disable Public Network Access default Disabled"
default = "Disabled"
}
variable "ecc_local_authentication_enabled"{
type = bool
description = "Enable/Disable Local Authentication default Disabled"
default = true
}
variable "ecc_azurerm_private_endpoint_subnet"{
type = string
description = "Subnet ID for Private Endpoint"
}
variable "ecc_subresource_names"{
type = string
description = "Subresource name for Private Endpoint default account default account"
default = "account"
}





