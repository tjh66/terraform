# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.39.0"
    }
  }
}
provider "azurerm" {
  subscription_id = "c430a196-889c-4f9c-be20-06d156fbcf6e"
  features {}
}

data "azurerm_resource_group" "ecc_ds_rg" {
  name = var.ecc_rg_name
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_cosmosdb_account" "ecc_cosmosdb" {
  name                = var.ecc_cosmosdb_name
  location            = var.ecc_location
  resource_group_name = var.ecc_rg_name
  public_network_access_enabled  = false
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  capabilities {
    name = "EnableServerless"
  }

  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }

  geo_location {
    location          = var.ecc_location
    failover_priority = 0
    zone_redundant = false
  }

  backup {
    interval_in_minutes = 240
    retention_in_hours  = 8
    storage_redundancy  = "Local"
    #tier                = ""
    type                = "Periodic"
  }

  identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_private_endpoint" "ecc_pep_cosmosdb" {
  name                = "pep-${var.ecc_cosmosdb_name}-sql"
  location            = var.ecc_location
  resource_group_name = var.ecc_rg_name
  subnet_id           = var.ecc_azurerm_private_endpoint_subnet

  private_service_connection {
    name                           = "psc-${azurerm_cosmosdb_account.ecc_cosmosdb.name}-sql"
    private_connection_resource_id = azurerm_cosmosdb_account.ecc_cosmosdb.id
    is_manual_connection           = false
    subresource_names              = ["sql"]
  }
}