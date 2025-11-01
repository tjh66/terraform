data "azurerm_mssql_server" "ecc_ds_mssql" {
  name                = var.ecc_mssql_name
  resource_group_name = var.ecc_mssql_rg_name
}

output "id" {
  value = data.azurerm_mssql_server.ecc_ds_mssql.id
}


resource "azurerm_mssql_database" "ecc_mssqldb" {
  name           = var.ecc_mssql_db
  server_id      = data.azurerm_mssql_server.ecc_ds_mssql.id
  collation      = var.ecc_mssql_db_collation
  license_type   = var.ecc_mssql_licence_type
  max_size_gb    = var.ecc_mssql_maxsizedb
  read_scale     = var.ecc_mssql_readscale
  sku_name       = var.ecc_mssql_sku
  zone_redundant = var.ecc_mssql_zoneredundant

}