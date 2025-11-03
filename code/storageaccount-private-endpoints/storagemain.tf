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
  #location = var.eccrgloc
}

resource "azurerm_storage_account" "ecc_stac" {
  name                              = var.ecc_azurerm_storage_account_name
  resource_group_name               = data.azurerm_resource_group.ecc_ds_rg.name
  location                          = data.azurerm_resource_group.ecc_ds_rg.location
  account_tier                      = var.ecc_azurerm_storage_account_tier
  account_replication_type          = var.ecc_azurerm_storage_account_replication_type
  account_kind                      = var.ecc_account_kind
  public_network_access_enabled     = false
  infrastructure_encryption_enabled = true
  is_hns_enabled                    = var.ecc_is_hns_enabled
  allow_nested_items_to_be_public   = var.ecc_allow_nested_items_to_be_public
  large_file_share_enabled          = var.ecc_large_file_share_enabled
  sftp_enabled                      = var.ecc_sftp_enabled

blob_properties {

delete_retention_policy {
days = var.ecc_blob_delete_retention_policy_days
permanent_delete_enabled = var.ecc_blob_delete_retention_policy_permanent_delete_enabled
}

container_delete_retention_policy {
days = var.ecc_container_delete_retention_policy_days
}

}

}

#########################PEP Storage for file###############################

 resource "azurerm_private_endpoint" "ecc_pepstac_file" {
  name                = "pep-${var.ecc_azurerm_storage_account_name}-${var.ecc_subresource_names}"
  location            = data.azurerm_resource_group.ecc_ds_rg.location
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  subnet_id           = var.ecc_azurerm_private_endpoint_file_storage_subnet

  private_service_connection {
    name                           = "psc-${var.ecc_azurerm_storage_account_name}-${var.ecc_subresource_names}"
    private_connection_resource_id = azurerm_storage_account.ecc_stac.id
    is_manual_connection           = false
    subresource_names              = [var.ecc_subresource_names]
  }

   depends_on = [
   azurerm_storage_account.ecc_stac
 ]
 }