
data "azurerm_subscription" "current" {
}

resource "azurerm_management_group" "ecc_new_child_mg" {
  name = var.ecc_mg_name
  display_name = var.ecc_mg_display_name
  parent_management_group_id = var.ecc_parent_mg_id

  #subscription_ids = [
   # data.azurerm_subscription.current.subscription_id,
  #]
}