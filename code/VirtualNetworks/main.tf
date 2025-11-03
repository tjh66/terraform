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

output "virtual_network_id" {
  value = data.azurerm_virtual_network.nvaservice.id
}

resource "azurerm_resource_group" "eccrgvnet" {
  name     = var.eccrgname
  location = var.eccrgloc
    tags = {
    BaseService = "No"
    CostCentre  = "CITS9200"
    Description = "Virtual Network"
    ServiceName = "Virtual Network"
    ServiceOwner = "Platform and Infrastructure"
    TSSupportingTeam = "Platform and Infrastructure"
	  Agreement = "EA"
  }
}

  #######################Create UDR#################################
 resource "azurerm_route_table" "eccudr" {
  name                          = var.eccudrname
  location                      = azurerm_resource_group.eccrgvnet.location
  resource_group_name           = azurerm_resource_group.eccrgvnet.name
  #disable_bgp_route_propagation = true

  route {
    name           = "DefaultRoute"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = "10.76.1.254"
  }

}

resource "azurerm_virtual_network" "eccvnetuks016" {
  name                = var.eccvnetname
  location            = azurerm_resource_group.eccrgvnet.location
  resource_group_name = azurerm_resource_group.eccrgvnet.name
  address_space       = ["10.78.0.0/16"]
  dns_servers         = ["10.74.0.68", "10.74.0.69"]
  ################Create Subnet for Azure Bastion###################
  subnet {
    name           = "AzureBastionSubnet"
    address_prefixes = "10.78.255.192/27"
  }

}

##########################Peering vNetuks016 to vNetuks014##########################

resource "azurerm_virtual_network_peering" "peeruks016touks014" {
  name                      = "uks-asr-nva-peering"
  resource_group_name       = azurerm_resource_group.eccrgvnet.name
  virtual_network_name      = azurerm_virtual_network.eccvnetuks016.name
  remote_virtual_network_id = "/subscriptions/fb8c0a66-922c-4279-9fbc-2d50b5f23a32/resourceGroups/paloalto-vnet/providers/Microsoft.Network/virtualNetworks/vnetuks014"
  allow_virtual_network_access=true
  allow_forwarded_traffic=true
}


##########################Peering vNetuks014 to vNet016##########################

resource "azurerm_virtual_network_peering" "peeruks014to016" {
  name                      = "uks-nva-asr-peering"
  resource_group_name       = data.azurerm_virtual_network.nvaservice.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.nvaservice.name
  remote_virtual_network_id = azurerm_virtual_network.eccvnetuks016.id
  allow_virtual_network_access=true
  allow_forwarded_traffic=false
  provider = azurerm.nva-services
  depends_on = [azurerm_virtual_network_peering.peeruks016touks014]
}






