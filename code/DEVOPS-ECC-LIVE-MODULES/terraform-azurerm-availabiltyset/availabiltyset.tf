###########################Resource Group Data Source###########

data "azurerm_resource_group" "ecc_existing_resource_group" {
  name = var.ecc_rg_name
}

output "id" {
  value = data.azurerm_resource_group.ecc_existing_resource_group.id
}



resource "azurerm_automation_account" "ecc_auto" {
  name                            = var.ecc_auto_name
  location                        = data.azurerm_resource_group.ecc_existing_resource_group.location
  resource_group_name             = data.azurerm_resource_group.ecc_existing_resource_group.name
  sku_name                        = var.ecc_auto_sku

 identity {
    type = "SystemAssigned"
  }

}