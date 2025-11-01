//Resource Group Data Source//

data "azurerm_resource_group" "ecc_ds_rg" {
  name = var.eccrgname
}

output "id" {
  value = data.azurerm_resource_group.ecc_ds_rg.id
}

//Create RSV//

resource "azurerm_recovery_services_vault" "vault" {
  name                          = var.eccrsvname
  location                      = data.azurerm_resource_group.ecc_ds_rg.location
  resource_group_name           = data.azurerm_resource_group.ecc_ds_rg.name
  sku                           = var.eccrsvsku
  soft_delete_enabled           = true
  public_network_access_enabled = var.eccrsvpublicaccess
  storage_mode_type             = var.eccrsvstoragemode
  cross_region_restore_enabled  = var.eccrsvcrossregion
}

