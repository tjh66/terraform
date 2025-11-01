# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.8.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "0823cfa7-7814-434b-abf9-655be3324067"
}

resource "azurerm_resource_group" "rg" {
    location = var.ecc_rg_location
    name     = var.ecc_rg_name
}

resource "azurerm_mssql_server" "sqlserver" {
    name                          = var.sqlserver_name
    resource_group_name           = var.ecc_rg_name
    location                      = var.ecc_rg_location
    version                       = "12.0"

    administrator_login           = var.ecc_sqlserver_uid
    administrator_login_password  = var.ecc_sqlserver_pw
    public_network_access_enabled = false

      identity {
    type = "SystemAssigned"
  }
  lifecycle {
    prevent_destroy = false
  }
   depends_on = [
   azurerm_resource_group.rg
 ]
}

resource "azurerm_mssql_database" "serverless_db" {
    name                        = "ics_live"
    server_id                   = azurerm_mssql_server.sqlserver.id
    collation                   = "Latin1_General_CI_AS" # should be Latin1_General_CI_AS
# SQL_Latin1_General_CP1_CI_AS
    auto_pause_delay_in_minutes = 60
    max_size_gb                 = 32
    min_capacity                = 0.5
    read_replica_count          = 0
    read_scale                  = false
    sku_name                    = "GP_S_Gen5_1"
    zone_redundant              = false

    threat_detection_policy {
        disabled_alerts      = []
        email_account_admins = "Disabled"
        email_addresses      = []
        retention_days       = 0
        state                = "Disabled"
        #use_server_default   = "Disabled"
    }
}

#########################PEP Storage for blob###############################

 resource "azurerm_private_endpoint" "ecc_pepstac_sqlserver" {
  name                = "pep-${var.sqlserver_name}-sqlserver"
  location            = var.ecc_rg_location
  resource_group_name = var.ecc_rg_name
  subnet_id           = var.ecc_azurerm_private_endpoint_sql_storage_subnet

  private_service_connection {
    name                           = "psc-${var.sqlserver_name}-sqlserver"
    private_connection_resource_id = azurerm_mssql_server.sqlserver.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }

 depends_on = [
   azurerm_mssql_server.sqlserver
 ]

 }