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


resource "azurerm_mssql_server" "eccsqlserver" {
  name                         = var.ecc_sqlserver_name
  resource_group_name          = var.ecc_rg_name
  location                     = var.ecc_rg_loc
  version                      = "12.0"
  administrator_login          = var.ecc_sqlserver_admin
  administrator_login_password = var.ecc_sqlserver_pw
  minimum_tls_version          = "1.2"

  
}