
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
  name = var.ecc_rg_name
}

#########################PEP Storage for file###############################

 resource "azurerm_private_endpoint" "ecc_pep" {
  name                = "pep-${var.ecc_azurerm_resource_name}-${var.ecc_subresource_names}"
  location            = data.azurerm_resource_group.ecc_ds_rg.location
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  subnet_id           = var.ecc_azurerm_private_endpoint_subnet

  private_service_connection {
    name                           = "psc-${var.ecc_azurerm_resource_name}-${var.ecc_subresource_names}"
    private_connection_resource_id = var.private_connection_resource_id
    is_manual_connection           = false
    subresource_names              = [var.ecc_subresource_names]
  }

 }