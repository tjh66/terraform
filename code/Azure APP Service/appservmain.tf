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

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}
