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



resource "azurerm_virtual_machine_scale_set_extension" "ecc_domain_join" {
  name                 = "join-domain"
# location             = "UK South"
 # resource_group_name  = "ea-tim-test-rg"
  virtual_machine_scale_set_id    = "/subscriptions/c430a196-889c-4f9c-be20-06d156fbcf6e/resourceGroups/ea-tim-test-rg/providers/Microsoft.Compute/virtualMachineScaleSets/vm001-vmss"
  publisher            = "Microsoft.Compute"
  type                 = "JsonADDomainExtension"
  type_handler_version = "1.3"
  

  settings = <<SETTINGS
    {
        "Name": "essexcc.local",
        "OUPath": "OU=Staging,OU=ECC10,DC=Essexcc,DC=local",
        "User": "essexcc\\svc-DomainJoin",
        "Restart": "true",
        "Options": 3
    }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
        "Password": "bREdraS=Ust82R="
    }
PROTECTED_SETTINGS
}