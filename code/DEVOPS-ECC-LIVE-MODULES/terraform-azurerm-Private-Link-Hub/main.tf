data "azurerm_resource_group" "ecc_ds_rg" {
  name = var.eccrgname
}

output "id" {
  value = data.azurerm_resource_group.ecc_ds_rg.id
}

resource "azurerm_synapse_private_link_hub" "eccpl" {
  name                = var.eccplname
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  location            = data.azurerm_resource_group.ecc_ds_rg.location


}