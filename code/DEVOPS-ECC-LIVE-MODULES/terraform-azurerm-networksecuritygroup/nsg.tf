
###########################Resource Group Data Source###########

data "azurerm_resource_group" "ecc_existing_resource_group" {
  name = var.ecc_rg_name
}

output "id" {
  value = data.azurerm_resource_group.ecc_existing_resource_group.id
}

############################SubNet Data Source####################

data "azurerm_subnet" "ecc_ds_subnet" {
  name                 = var.ecc_subnet_name
  virtual_network_name = var.ecc_vnet_name
  resource_group_name  = var.ecc_vnet_rg_name
}

output "subnet_id" {
  value = data.azurerm_subnet.ecc_ds_subnet.id
}

#########################New NSG#################################

resource "azurerm_network_security_group" "new_nsg" {
  name                = "${var.ecc_new_nsg_name}-nsg"
  location            = data.azurerm_resource_group.ecc_existing_resource_group.location
  resource_group_name = data.azurerm_resource_group.ecc_existing_resource_group.name

}
##################Associate Subnet to NSG#######################

resource "azurerm_subnet_network_security_group_association" "ecc_subnet_nsg" {
  subnet_id                 = data.azurerm_subnet.ecc_ds_subnet.id
  network_security_group_id = azurerm_network_security_group.new_nsg.id
}

