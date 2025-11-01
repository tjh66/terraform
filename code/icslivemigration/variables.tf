
variable "ecc_rg_location" {
  type = string
  description = "Resource Group Location"
}

  variable "ecc_rg_name" {
  type = string
  description = "Resource Group Name"
}

  variable "sqlserver_name" {
  type = string
  description = "SQL Server Name"
  default = "db00000100000"
}

  variable "ecc_sqlserver_uid" {
  type = string
  description = "SQL Server User Name"
  default = "sqlserveradmin"
}

  variable "ecc_sqlserver_pw" {
  type = string
  description = "SQL Server Password"
  default = "db00000100000$$##"
}

  variable "ecc_azurerm_private_endpoint_sql_storage_subnet" {
  type = string
  description = "SQL Server pep subnet id"
  default = "/subscriptions/0823cfa7-7814-434b-abf9-655be3324067/resourceGroups/production-vnet/providers/Microsoft.Network/virtualNetworks/vnetuks003/subnets/vnetuks003_10.57.0.128_27"
}