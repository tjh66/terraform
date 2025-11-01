data "azurerm_resource_group" "ecc_ds_rg" {
  name = var.eccrgname
}

output "id" {
  value = data.azurerm_resource_group.ecc_ds_rg.id
}

resource "azurerm_purview_account" "eccpurviewdev" {
  name                = var.eccpurviewname
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  location            = data.azurerm_resource_group.ecc_ds_rg.location

  identity {
    type = "SystemAssigned"
  }
}