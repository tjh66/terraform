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
  subscription_id = "c430a196-889c-4f9c-be20-06d156fbcf6e"
  features {}
}



###########################Resource Group Data Source###########

data "azurerm_resource_group" "ecc_existing_resource_group" {
  name = var.ecc_rg_name
}

output "id" {
  value = data.azurerm_resource_group.ecc_existing_resource_group.id
}

############################vNet Data Source####################

data "azurerm_virtual_network" "ecc_ds_existing_vnet" {
  name                = var.ecc_existing_vnet
  resource_group_name = var.ecc_existing_vnet_rg
}

output "virtual_network_id" {
  value = data.azurerm_virtual_network.ecc_ds_existing_vnet.id
}

##########################New Subnet#############################

resource "azurerm_subnet" "eccsubnet" {
  name                 = var.ecc_new_subnet_name
  resource_group_name  = data.azurerm_virtual_network.ecc_ds_existing_vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.ecc_ds_existing_vnet.name
  address_prefixes     = [var.ecc_new_subnet_prefix]
  service_endpoints = ["Microsoft.Storage","Microsoft.Sql","Microsoft.KeyVault"]
  private_endpoint_network_policies = var.ecc_private_endpoint_network_policies
}

######################Data Source UDR###########################

data "azurerm_route_table" "ecc_ds_udr" {
  name                = var.ecc_existing_udr
  resource_group_name = data.azurerm_virtual_network.ecc_ds_existing_vnet.resource_group_name
}


##################Associate Subnet to UDR#######################

resource "azurerm_subnet_route_table_association" "ecc_subnet_udr" {
  subnet_id      = azurerm_subnet.eccsubnet.id
  route_table_id = data.azurerm_route_table.ecc_ds_udr.id
}
