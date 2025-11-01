###########################Resource Group Data Source###########

data "azurerm_resource_group" "ecc_existing_resource_group" {
  name = var.ecc_rg_name
}

output "id" {
  value = data.azurerm_resource_group.ecc_existing_resource_group.id
}

###########################Resource LogAnalytics Workspace###########

resource "azurerm_log_analytics_workspace" "ecc-create-la" {
  name                = var.ecc_law_name
  location            = data.azurerm_resource_group.ecc_existing_resource_group.location
  resource_group_name = data.azurerm_resource_group.ecc_existing_resource_group.name
  sku                 = var.ecc_law_sku
  retention_in_days   = var.ecc_law_retention
}