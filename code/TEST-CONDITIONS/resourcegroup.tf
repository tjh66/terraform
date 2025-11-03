  terraform {
  required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = ">= 2.96.0"
      }
  }
  }

  provider "azurerm" {
    features {}
  }

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "ecc_new_rg" {
  name     = var.name
  location = var.location
}


resource "azurerm_key_vault" "example" {
  count    = var.keyvault_name == "" ? 0 : 1 # if var empty skip deploy block this is tested and working
  name                        = var.keyvault_name
  location                    = azurerm_resource_group.ecc_new_rg.location
  resource_group_name         = azurerm_resource_group.ecc_new_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}