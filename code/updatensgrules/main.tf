# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.46.0"
    }
  }
}

data "azurerm_client_config" "current" {}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

###########################Resource Group Data Source###########

data "azurerm_resource_group" "ecc_existing_resource_group" {
  name = var.eccrgname
}

output "id" {
  value = data.azurerm_resource_group.ecc_existing_resource_group.id
}

############################NSG Data Source####################

data "azurerm_network_security_group" "ecc_ds_nsg" {
  name                = var.eccrgname
  resource_group_name = data.azurerm_resource_group.ecc_existing_resource_group.name
}

output "location" {
  value = data.azurerm_network_security_group.ecc_ds_nsg.location
}

############################NSG################################
resource "azurerm_network_security_group" "ecc_nsg_update" {
  name                = var.eccnsgname
  location            = data.azurerm_resource_group.ecc_existing_resource_group.location
  resource_group_name = data.azurerm_resource_group.ecc_existing_resource_group.name
}

resource "azurerm_network_security_rule" "ecc_nsg_update_rule" {
    security_rule {
    name                       = "AzureBast"
    priority                   = 600
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefixes    = ["10.79.255.192/27","10.83.255.192/27","10.83.255.192/27"]
    destination_address_prefix = "10.79.0.224/27"
    }
}

  resource_group_name         = data.azurerm_resource_group.ecc_existing_resource_group.name
  network_security_group_name = azurerm_network_security_group.ecc_nsg_update.name
