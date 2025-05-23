variable "ecc_rg_name"{
type = string
description = "Name of Resource Group that the required endpoint is to be deployed."
}
variable "ecc_subresource_names"{
type = string
description = "Name of Subresource for private endpoint."
}
variable "ecc_azurerm_resource_name"{
type = string
description = "Name of Resource."
}
variable "ecc_azurerm_private_endpoint_subnet"{
type = string
description = "Subnet Id that the private endpoint will comsume."
}
variable "private_connection_resource_id"{
type = string
description = "Resource Id of the resource that requires the private endpoint."
}
