# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.86.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}

locals {
  vnet_name = "vnetuks023"
  vnet_rg_name = "management-vnet"
  vnet_rg_loc = "UK South"
  udr_name = "vnetuks023-udr-rt"
}

data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "ecc_rg" {
  name     = local.vnet_rg_name
  location = local.vnet_rg_loc

  tags = {
    Agreement = "EA"
    BaseService = "No"
    CostCentre = ""
    Description = "UKS vNet for Management Subscription"
    ServiceName = "Virtual Network"
    ServiceOwner = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"
  }

}

resource "azurerm_virtual_network" "ecc_vnet" {
  name                = local.vnet_name
  location            = azurerm_resource_group.ecc_rg.location
  resource_group_name = azurerm_resource_group.ecc_rg.name
  address_space       = ["10.87.6.0/24","10.87.7.0/24"]
  
  tags = {
    Agreement = "EA"
    BaseService = "No"
    CostCentre = ""
    Description = "UKS vNet for Management Subscription"
    ServiceName = "Virtual Network"
    ServiceOwner = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"
  }
}

  #######################Create UDR#################################
 resource "azurerm_route_table" "eccudr" {
  disable_bgp_route_propagation = true
  name                          = local.udr_name
  location                      = azurerm_resource_group.ecc_rg.location
  resource_group_name           = azurerm_resource_group.ecc_rg.name


  route {
    name           = "DefaultRoute"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = "10.76.1.254"
    
  }

      route {
    name           = "EA-GP-PALO01-SUBNETS"
    address_prefix = "10.71.128.0/19"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = "10.76.1.4"
  }

  route {
    name           = "EA-GP-PALO02-SUBNETS"
    address_prefix = "10.71.160.0/19"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = "10.76.1.5"
  }

    tags = {
    Agreement = "EA"
    BaseService = "No"
    CostCentre = ""
    Description = "UKS vNet UDR for Management Subscription"
    ServiceName = "Route Table"
    ServiceOwner = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"
  }

}