# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.86.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}



data "azurerm_resource_group" "ecc_ds_rg" {
  name = "logicapplications"
}

resource "azurerm_storage_account" "ecc_stac" {
  name                     = "staclogapp007"
  resource_group_name      = data.azurerm_resource_group.ecc_ds_rg.name
  location                 = data.azurerm_resource_group.ecc_ds_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "ecc_app_sp" {
  name                = "logapp007-service-plan"
  location            = data.azurerm_resource_group.ecc_ds_rg.location
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  kind                = "elastic"


  sku {
    tier = "WorkflowStandard"
    size = "WS1"
  }
}

resource "azurerm_logic_app_standard" "example" {
  name                       = "ecc-dev-logap001"
  location                   = data.azurerm_resource_group.ecc_ds_rg.location
  resource_group_name        = data.azurerm_resource_group.ecc_ds_rg.name
  app_service_plan_id        = azurerm_app_service_plan.ecc_app_sp.id
  storage_account_name       = azurerm_storage_account.ecc_stac.name
  storage_account_access_key = azurerm_storage_account.ecc_stac.primary_access_key

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"     = "node"
    "WEBSITE_NODE_DEFAULT_VERSION" = "~18"
  }

    identity {
    type = "SystemAssigned"
  }

}