# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

data "azurerm_client_config" "current" {}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  #version = "=2.46.0"
  alias = "nva-services"
  client_id = var.eccclientid
  client_secret = var.eccclientsecret
  subscription_id = "fb8c0a66-922c-4279-9fbc-2d50b5f23a32"
  tenant_id = "a8b4324f-155c-4215-a0f1-7ed8cc9a992f"
  features {}
}

provider "azurerm" { 
  features {} 
  }
###############nva-services vnet datasource###############

data "azurerm_virtual_network" "nvaservice" {
  name = "vnetuks014"
  resource_group_name = "paloalto-vnet"
  provider = azurerm.nva-services
}

data "azurerm_virtual_network" "m2aaservice" {
  name = "vnetuks019"
  resource_group_name = "analytics-vnet"
  #provider = azurerm.nva-services
}

output "virtual_network_id" {
  value = data.azurerm_virtual_network.nvaservice.id
}

data "azurerm_resource_group" "ecc_ds_rg" {
  name = var.eccrgname
}



##########################Peering vNetuks019 to vNetuks014##########################

resource "azurerm_virtual_network_peering" "peeruks019touks014" {
  name                      = "uks-m2aa-nva-peering"
  resource_group_name       = data.azurerm_virtual_network.m2aaservice.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.m2aaservice.name
  remote_virtual_network_id = "/subscriptions/fb8c0a66-922c-4279-9fbc-2d50b5f23a32/resourceGroups/paloalto-vnet/providers/Microsoft.Network/virtualNetworks/vnetuks014"
  allow_virtual_network_access=true
  allow_forwarded_traffic=true
}


##########################Peering vNetuks014 to vNetuks019##########################

resource "azurerm_virtual_network_peering" "peeruks014to019" {
  name                      = "uks-nva-m2aa-peering"
  resource_group_name       = data.azurerm_virtual_network.nvaservice.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.nvaservice.name
  remote_virtual_network_id = "/subscriptions/899afc37-b64d-4001-9bc3-33ad9ea4e377/resourceGroups/analytics-vnet/providers/Microsoft.Network/virtualNetworks/vnetuks019"
  allow_virtual_network_access=true
  allow_forwarded_traffic=false
  provider = azurerm.nva-services
  depends_on = [azurerm_virtual_network_peering.peeruks016touks014]
}






