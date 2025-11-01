

data "azurerm_mssql_server" "ecc_ds_mssql" {
  name                = var.ecc_mssql_name
  resource_group_name = var.ecc_rg_name
}

output "id" {
  value = data.azurerm_mssql_server.ecc_ds_mssql.id
}

resource "azurerm_mssql_firewall_rule" "iboss1" {
  name                 = "iboss1"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "185.251.10.107"
  end_ip_address       = "185.251.10.107"
  }
resource "azurerm_mssql_firewall_rule" "iboss2" {
  name                 = "iboss2"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "136.228.224.123"
  end_ip_address       = "136.228.224.123"
}
resource "azurerm_mssql_firewall_rule" "iboss3" {
  name                 = "iboss3"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "136.228.233.55"
  end_ip_address       = "136.228.233.55"
}
resource "azurerm_mssql_firewall_rule" "iboss4" {
  name                 = "iboss4"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "185.251.10.12"
  end_ip_address       = "185.251.10.12"
}
resource "azurerm_mssql_firewall_rule" "iboss5" {
  name                 = "iboss5"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "136.228.225.71"
  end_ip_address       = "136.228.225.71"
}
resource "azurerm_mssql_firewall_rule" "iboss6" {
  name                 = "iboss6"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "185.251.11.142"
  end_ip_address       = "185.251.11.142"
}
resource "azurerm_mssql_firewall_rule" "iboss7" {
  name                 = "iboss7"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "136.228.224.119"
  end_ip_address       = "136.228.224.119"
}
resource "azurerm_mssql_firewall_rule" "iboss8" {
  name                 = "iboss8"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "185.251.10.164"
  end_ip_address       = "185.251.10.164"
}
resource "azurerm_mssql_firewall_rule" "iboss9" {
  name                 = "iboss9"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "136.228.232.21"
  end_ip_address       = "136.228.232.21"
}
resource "azurerm_mssql_firewall_rule" "iboss10" {
  name                 = "iboss10"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "136.228.224.193"
  end_ip_address       = "136.228.224.193"
}
resource "azurerm_mssql_firewall_rule" "iboss11" {
  name                 = "iboss11"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "136.228.255.204"
  end_ip_address       = "136.228.255.204"
}
resource "azurerm_mssql_firewall_rule" "iboss12" {
  name                 = "iboss12"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "136.228.232.209"
  end_ip_address       = "136.228.232.209"
}
resource "azurerm_mssql_firewall_rule" "iboss13" {
  name                 = "iboss13"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "185.251.11.186"
  end_ip_address       = "185.251.11.186"
}
resource "azurerm_mssql_firewall_rule" "iboss14" {
  name                 = "iboss14"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "136.228.233.144"
  end_ip_address       = "136.228.233.144"
}
resource "azurerm_mssql_firewall_rule" "iboss15" {
  name                 = "iboss15"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "136.228.224.14"
  end_ip_address       = "136.228.224.14"
}
resource "azurerm_mssql_firewall_rule" "iboss16" {
  name                 = "iboss16"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "136.228.225.153"
  end_ip_address       = "136.228.225.153"
}
resource "azurerm_mssql_firewall_rule" "iboss17" {
  name                 = "iboss17"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "185.251.11.126"
  end_ip_address       = "185.251.11.126"
}
resource "azurerm_mssql_firewall_rule" "iboss18" {
  name                 = "iboss18"
  server_id            = data.azurerm_mssql_server.ecc_ds_mssql.id
  start_ip_address     = "10.74.7.100"
  end_ip_address       = "10.74.7.100"
}


















