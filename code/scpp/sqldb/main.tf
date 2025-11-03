# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.82.0"
    }
  }
}

data "azurerm_client_config" "current" {}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


data "azurerm_mssql_server" "ecc_ds_mssql" {
  name                = var.ecc_mssql_name
  resource_group_name = var.ecc_mssql_rg_name
}

output "id" {
  value = data.azurerm_mssql_server.ecc_ds_mssql.id
}


resource "azurerm_mssql_database" "ecc_mssqldb" {
  name                        = var.ecc_mssql_db
  server_id                   = data.azurerm_mssql_server.ecc_ds_mssql.id
  collation                   = var.ecc_mssql_db_collation
  license_type                = var.ecc_mssql_licence_type
  max_size_gb                 = var.ecc_mssql_maxsizedb
  read_scale                  = var.ecc_mssql_readscale
  sku_name                    = var.ecc_mssql_sku
  zone_redundant              = var.ecc_mssql_zoneredundant
  storage_account_type        = var.ecc_storage_backup_type
  auto_pause_delay_in_minutes = var.ecc_auto_pause_delay
}