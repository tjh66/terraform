###########################Resource Group Data Source###########

data "azurerm_resource_group" "ecc_existing_resource_group" {
  name = var.ecc_rg_name
}

output "id" {
  value = data.azurerm_resource_group.ecc_existing_resource_group.id
}


################ Data Source Virtual Machine######################

data "azurerm_virtual_machine" "eccdsvm" {
  name                = var.ecc_vm_name
  resource_group_name = var.ecc_rg_name
}

output "virtual_machine_id" {
  value = data.azurerm_virtual_machine.eccdsvm.id
}

############################## Data Disk #########################
resource "azurerm_managed_disk" "eccmgdisk" {
name = "${var.ecc_vm_name}-${var.ecc_vm_disk_label}"
location = data.azurerm_resource_group.ecc_existing_resource_group.location
resource_group_name = data.azurerm_resource_group.ecc_existing_resource_group.name
storage_account_type = var.ecc_vm_disk_type
create_option = "Empty"
disk_size_gb = var.ecc_vm_disk_size
}

resource "azurerm_virtual_machine_data_disk_attachment" "eccattachdisk" {
managed_disk_id = azurerm_managed_disk.eccmgdisk.id
virtual_machine_id = data.azurerm_virtual_machine.eccdsvm.id
lun = var.ecc_vm_disk_lun
caching = var.ecc_vm_disk_cache
}

####################################################################