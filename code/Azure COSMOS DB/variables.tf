variable "ecc_location"{
type = string
description = "Region of workspace to be deployed"
}
variable "ecc_rg_name"{
type = string
description = "Name of existing Resource Group"
}
variable "ecc_azurerm_private_endpoint_subnet"{
type = string   
description = "Subnet ID for Private Endpoint"
}
variable "ecc_cosmosdb_name" {
type=string
description = "Name of Cosmos Instance"
}