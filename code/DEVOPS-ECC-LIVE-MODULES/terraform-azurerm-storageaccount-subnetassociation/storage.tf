###########################Resource Group Data Source###########

data "azurerm_resource_group" "ecc_existing_resource_group" {
  name = var.ecc_rg_name
}

output "id" {
  value = data.azurerm_resource_group.ecc_existing_resource_group.id
}


###########################Subnet Data Source###########
data "azurerm_subnet" "ecc_existing_subnet" {
  name                 = var.ecc_stac_subnet_name
  virtual_network_name = var.ecc_stac_vnet_name
  resource_group_name  = var.ecc_stac_vnet_rg
}

output "subnet_id" {
  value = data.azurerm_subnet.ecc_existing_subnet.id
}

###########################Create Storage Account

resource "azurerm_storage_account" "eccnewstac" {
  name                          = var.ecc_stac_name
  resource_group_name           = data.azurerm_resource_group.ecc_existing_resource_group.name
  location                      = data.azurerm_resource_group.ecc_existing_resource_group.location
  account_tier                  = var.ecc_stac_account_tier
  account_replication_type      = var.ecc_stac_account_replication
  is_hns_enabled                = var.ecc_stac_hns_enabled
  sftp_enabled                  = var.ecc_stac_sftp_enabled
  public_network_access_enabled = var.ecc_stac_public_access_enabled

    network_rules {
    default_action             = "Deny"
    ip_rules                   =["136.228.232.21","136.228.224.119","136.228.224.123","136.228.224.14","136.228.224.193","136.228.225.153","136.228.225.204","136.228.225.71","136.228.232.209","136.228.233.144","136.228.233.55","185.251.10.107","185.251.10.12","185.251.10.164","185.251.11.126","185.251.11.142","185.251.11.186"]
    virtual_network_subnet_ids = [data.azurerm_subnet.ecc_existing_subnet.id]
  }

}
  output "stac_id"{
     value = azurerm_storage_account.eccnewstac.id
  }