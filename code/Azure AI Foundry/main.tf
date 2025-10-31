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


resource "azurerm_ai_services" "ecc_foundry" {
  name                               = var.ecc_azurerm_ai_services
  location                           = var.ecc_location
  resource_group_name                = var.ecc_rg_name
  sku_name                           = var.ecc_azurerm_ai_services_sku
  public_network_access              = var.ecc_public_network_access
  local_authentication_enabled       = var.ecc_local_authentication_enabled
  custom_subdomain_name              = var.ecc_azurerm_ai_services
  identity {
    type         = "SystemAssigned"
  }

 
}

#########################PEP###############################

 resource "azurerm_private_endpoint" "ecc_pep_account" {
  name                = "pep-${var.ecc_azurerm_ai_services}-${var.ecc_subresource_names}"
  location            = data.azurerm_resource_group.ecc_ds_rg.location
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  subnet_id           = var.ecc_azurerm_private_endpoint_subnet

  private_service_connection {
    name                           = "psc-${var.ecc_azurerm_ai_services}-${var.ecc_subresource_names}"
    private_connection_resource_id = azurerm_ai_services.ecc_foundry.id
    is_manual_connection           = false
    subresource_names              = [var.ecc_subresource_names]
  }

 }

######################END PEP###############################

 