# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.8.0"
    }
  }
}
provider "azurerm" {
  subscription_id = "0823cfa7-7814-434b-abf9-655be3324067"
  features {}
}



data "azurerm_resource_group" "ecc_ds_rg" {
  name = var.eccrgname
  #location = var.eccrgloc
}

resource "azurerm_storage_account" "ecc_stac" {
  name                     = var.ecc_azurerm_storage_account_name
  resource_group_name      = data.azurerm_resource_group.ecc_ds_rg.name
  location                 = data.azurerm_resource_group.ecc_ds_rg.location
  account_tier             = var.ecc_azurerm_storage_account_tier
  account_replication_type = var.ecc_azurerm_storage_account_replication_type
 # public_network_access_enabled = false
}

resource "azurerm_service_plan" "ecc_la_sp" {
  name                = var.ecc_azurerm_service_plan_name
  location            = data.azurerm_resource_group.ecc_ds_rg.location
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name

  os_type  = var.ecc_azurerm_service_plan_name_os_type
  sku_name = var.ecc_azurerm_service_plan_name_sku_name
}

resource "azurerm_logic_app_standard" "ecc_la" {
  name                       = var.ecc_azurerm_logic_app_standard_name
  location                   = data.azurerm_resource_group.ecc_ds_rg.location
  resource_group_name        = data.azurerm_resource_group.ecc_ds_rg.name
  app_service_plan_id        = azurerm_service_plan.ecc_la_sp.id
  storage_account_name       = azurerm_storage_account.ecc_stac.name
  storage_account_access_key = azurerm_storage_account.ecc_stac.primary_access_key
  

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"     = var.ecc_app_setting_functions_worker_runtime
    "WEBSITE_NODE_DEFAULT_VERSION" = var.ecc_default_node_runtime  
  }
  identity {
    type = "SystemAssigned"
  }

}
#########################PEP Storage for file###############################

 resource "azurerm_private_endpoint" "ecc_pepstac_file" {
  name                = "pep-${var.ecc_azurerm_storage_account_name}-file"
  location            = data.azurerm_resource_group.ecc_ds_rg.location
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  subnet_id           = var.ecc_azurerm_private_endpoint_file_storage_subnet

  private_service_connection {
    name                           = "psc-${var.ecc_azurerm_storage_account_name}-file"
    private_connection_resource_id = azurerm_storage_account.ecc_stac.id
    is_manual_connection           = false
    subresource_names              = ["file"]
  }

   depends_on = [
    azurerm_logic_app_standard.ecc_la
 ]
 }


#########################PEP Storage for blob###############################

 resource "azurerm_private_endpoint" "ecc_pepstac_blob" {
  name                = "pep-${var.ecc_azurerm_storage_account_name}-blob"
  location            = data.azurerm_resource_group.ecc_ds_rg.location
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  subnet_id           = var.ecc_azurerm_private_endpoint_blob_storage_subnet

  private_service_connection {
    name                           = "psc-${var.ecc_azurerm_storage_account_name}-blob"
    private_connection_resource_id = azurerm_storage_account.ecc_stac.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

 depends_on = [
    azurerm_logic_app_standard.ecc_la
 ]

 }

 #########################PEP for logic app###############################


 resource "azurerm_private_endpoint" "ecc_pepstac_logicapp" {
  name                = "pep-${var.ecc_azurerm_logic_app_standard_name}-sites"
  location            = data.azurerm_resource_group.ecc_ds_rg.location
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  subnet_id           = var.ecc_azurerm_private_endpoint_logic_app_subnet

  private_service_connection {
    name                           = "psc-${var.ecc_azurerm_logic_app_standard_name}-sites"
    private_connection_resource_id = azurerm_logic_app_standard.ecc_la.id
    is_manual_connection           = false
    subresource_names              = ["sites"]
  }

   depends_on = [
    azurerm_logic_app_standard.ecc_la
 ]
 }

