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
  auto_pause_delay_in_minutes = var.autopause
  max_size_gb    = var.ecc_mssql_maxsizedb
  min_capacity   = var.ecc_mssql_mincapacity
  read_scale     = var.ecc_mssql_readscale
  sku_name       = var.ecc_mssql_sku
  zone_redundant = var.ecc_mssql_zoneredundant

}