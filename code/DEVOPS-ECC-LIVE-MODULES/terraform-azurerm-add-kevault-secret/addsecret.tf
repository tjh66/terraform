####################Get Vault########################


data "azurerm_key_vault" "ecc_ds_kv" {
  name                = var.ecc_kv_name
  resource_group_name = var.ecc_rg_name
}
output "vault_uri" {
  value = data.azurerm_key_vault.ecc_ds_kv.vault_uri
}

############## Add New Secret######################


resource "azurerm_key_vault_secret" "ecc_new_secret" {
  name         = var.ecc_kv_secret
  value        = var.ecc_kv_secret_value
  key_vault_id = data.azurerm_key_vault.ecc_ds_kv.id
}