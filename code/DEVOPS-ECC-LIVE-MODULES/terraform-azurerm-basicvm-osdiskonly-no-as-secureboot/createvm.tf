###########################Resource Group Data Source############

data "azurerm_resource_group" "ecc_existing_resource_group" {
  name = var.ecc_rg_name
}

output "id" {
  value = data.azurerm_resource_group.ecc_existing_resource_group.id
}

###########################Subnet Data Source###########

data "azurerm_subnet" "ecc_existing_subnet" {
  name                 = var.ecc_vm_subnet_name
  virtual_network_name = var.ecc_vm_vnet_name
  resource_group_name  = var.ecc_vm_vnet_rg
}

output "subnet_id" {
  value = data.azurerm_subnet.ecc_existing_subnet.id
}

##################################Availabilty Set Data#######################

# data "azurerm_availability_set" "ecc_existing_as" {
#   name                = var.ecc_vm_as_name
#  resource_group_name = var.ecc_rg_name
#}

#output "availability_set_id" {
#  value = data.azurerm_availability_set.ecc_existing_as.id
#}

##############################Azure VM Backup Policy Data####################

#data "azurerm_backup_policy_vm" "ecc_backup_policy" {
#  name                = var.eccbackuppolicyname
#  recovery_vault_name = var.eccbackuppolicyvaultname
#  resource_group_name = var.eccbackuppolicyvaultRG
#}

#########################Create Virtual Machine NIC##########################

resource "azurerm_network_interface" "eccvmnic" {
  name                = "${var.ecc_vm_name}-nic"
  location            = data.azurerm_resource_group.ecc_existing_resource_group.location
  resource_group_name = data.azurerm_resource_group.ecc_existing_resource_group.name
  ip_configuration {
    name                          = "IPConfig"
    private_ip_address_allocation = "Static"
    private_ip_address            = var.ecc_vm_ip #Remove if private_ip_address_allocation = Static
    subnet_id                     = data.azurerm_subnet.ecc_existing_subnet.id
  }
}

#########################Create Virtual Machine #############################


resource "azurerm_windows_virtual_machine" "eccvm" {
  name                        = var.ecc_vm_name
  resource_group_name         = data.azurerm_resource_group.ecc_existing_resource_group.name
  location                    = data.azurerm_resource_group.ecc_existing_resource_group.location
  size                        = var.ecc_vm_size
  # availability_set_id         = data.azurerm_availability_set.ecc_existing_as.id
  admin_username              = "AzureServerSupport"
  admin_password              = var.ecc_vm_pw
  enable_automatic_updates    = "false"
  patch_mode                  = var.ecc_patch_mode
  provision_vm_agent          = "true"                         #data.azurerm_key_vault_secret.eccvmpassword.value
  timezone                    = "GMT Standard Time"
  license_type                = "Windows_Server"
  vtpm_enabled = "true"
  secure_boot_enabled = "true"
  # integrity_monitoring = "true"
  tags  = { PatchGroup = var.ecc_patch_grp
            BootType   = "Secure"
          }
  network_interface_ids       = [
    azurerm_network_interface.eccvmnic.id,
  ]

  os_disk {
    caching               = "ReadWrite"
    storage_account_type  = var.ecc_vm_storage_type
    disk_size_gb          = "128"
  }

  source_image_reference {
    publisher = var.ecc_vm_server_publisher
    offer     = var.ecc_vm_server_offer
    sku       = var.ecc_vm_server_sku
    version   = var.ecc_vm_server_version
  }

  identity {
    type = "SystemAssigned"
  }


  depends_on = [
    azurerm_network_interface.eccvmnic
  ]
}

resource "azurerm_virtual_machine_extension" "GuestAttestation" {
  name                 = "GuestAttestation"
  virtual_machine_id   =  azurerm_windows_virtual_machine.eccvm.id #azurerm_linux_virtual_machine.example.id
  publisher            = "Microsoft.Azure.Security.WindowsAttestation"
  type                 = "GuestAttestation"
  type_handler_version = "1.0"

  settings = <<SETTINGS
{
  "commandToExecute": "hostname && uptime"
}
SETTINGS
}


