variable "eccrgname"{
type = string
description = "Name of Resource Group or Existing Resource Group"
default = "RGName"
}
variable "eccrgloc"{
type = string
description = "Location of Resource Group or Existing Resource Group"
default = "UK South"
}
variable "ecc_azurerm_service_plan_name" {
    type = string
    description = "Name of new LogicApp"
}

variable "ecc_azurerm_service_plan_name_os_type" {
    type = string
    description = "App Plan OS type default is Windows"
    default = "Windows"
}

variable "ecc_azurerm_service_plan_name_sku_name" {
    type = string
    description = "App Plan SKU default is WS1"
    default = "WS1"
}

variable "ecc_app_setting_functions_worker_runtime" {
    type = string
    description = "Default is node (please read terraform documentation for other options)"
    default = "node"
  
}

variable "ecc_default_node_runtime" {
  type = string
  description = "Default is ~18 (please read terraform documentation for other options)"
  default = "~18"
}

variable "ecc_azurerm_storage_account_name" {
  type = string
  description = "New name of storage account must start with stac"
}

variable "ecc_azurerm_storage_account_tier" {
  type = string
  description = "Storage account tier default is Standard"
  default = "Standard"
}

variable "ecc_azurerm_storage_account_replication_type" {
  type = string
  description = "Storage account replication type default is LRS"
  default = "LRS"
}

variable "ecc_azurerm_private_endpoint_file_storage_subnet" {
  type = string
  description = "Subnet iD for the private endpoint file"
}

variable "ecc_azurerm_private_endpoint_blob_storage_subnet" {
  type = string
  description = "Subnet iD for the private endpoint blob"
}

variable "ecc_azurerm_logic_app_standard_name" {
    type = string
    description = "Name of new logic app must start with la"
  
}

variable "ecc_azurerm_private_endpoint_logic_app_subnet" {
  type = string
  description = "Subnet iD for the private endpoint logicapp"
}