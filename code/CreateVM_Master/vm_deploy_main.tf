
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.8.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "0823cfa7-7814-434b-abf9-655be3324067"
}

###########################Resource Group Data Source###################

data "azurerm_resource_group" "ecc_existing_resource_group" {
  name = var.ecc_rg_name
}

output "id" {
  value = data.azurerm_resource_group.ecc_existing_resource_group.id
}

###########################Subnet Data Source############################

data "azurerm_subnet" "ecc_existing_subnet" {
  name                 = var.ecc_vm_subnet_name
  virtual_network_name = var.ecc_vm_vnet_name
  resource_group_name  = var.ecc_vm_vnet_rg
}

output "subnet_id" {
  value = data.azurerm_subnet.ecc_existing_subnet.id
}

##################################Availabilty Set Data#######################

data "azurerm_availability_set" "ecc_existing_as"  {
   count = var.ecc_existing_as != ""? 1 : 0
   name                = var.ecc_existing_as
   resource_group_name = var.ecc_rg_name
}

#########################Create Virtual Machine NIC##########################

resource "azurerm_network_interface" "eccvmnic" {
  name                = "${var.ecc_vm_name}-nic"
  location            = data.azurerm_resource_group.ecc_existing_resource_group.location
  resource_group_name = data.azurerm_resource_group.ecc_existing_resource_group.name
  ip_configuration {
    name                          = "IPConfig"
    private_ip_address_allocation = "Static"
    private_ip_address            = var.ecc_vm_ip
    subnet_id                     = data.azurerm_subnet.ecc_existing_subnet.id
  }
}

#########################Create Virtual Machine #############################


resource "azurerm_windows_virtual_machine" "eccvm" {
  name                        = var.ecc_vm_name
  resource_group_name         = data.azurerm_resource_group.ecc_existing_resource_group.name
  location                    = data.azurerm_resource_group.ecc_existing_resource_group.location
  size                        = var.ecc_vm_size
  availability_set_id         = var.ecc_existing_as == "" ? null : var.ecc_existing_as
  admin_username              = "AzureServerSupport"
  admin_password              = var.ecc_vm_pw
  enable_automatic_updates                               = var.ecc_automatic_updates
  bypass_platform_safety_checks_on_user_schedule_enabled = var.ecc_bypass_platform_safety_checks 
  patch_mode                  = var.ecc_patch_mode
  provision_vm_agent          = "true"                         
  timezone                    = "GMT Standard Time"
  license_type                = "Windows_Server"
  vtpm_enabled = "true"
  zone = var.ecc_avail_zone == "" ? null : var.ecc_avail_zone
  secure_boot_enabled = "true"
  # integrity_monitoring = "true"
    tags  = merge({ PatchGroup = var.ecc_patch_grp
            BootType   = "Secure"
            PatchMethod= var.ecc_patch_method
            },var.ecc_tags)
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
  virtual_machine_id   =  azurerm_windows_virtual_machine.eccvm.id
  publisher            = "Microsoft.Azure.Security.WindowsAttestation"
  type                 = "GuestAttestation"
  type_handler_version = "1.0"

  settings = <<SETTINGS
{
  "commandToExecute": "hostname && uptime"
}
SETTINGS
}


##################Auto Shutdown##############################
resource "azurerm_dev_test_global_vm_shutdown_schedule" "ecc_vm_shutdown_schedule" {
  count              = var.ecc_azurerm_dev_test_global_vm_shutdown_schedule != ""? 1 : 0
  virtual_machine_id = azurerm_windows_virtual_machine.eccvm.id
  location           = data.azurerm_resource_group.ecc_existing_resource_group.location
  enabled            = var.ecc_azurerm_dev_test_global_vm_shutdown_schedule

  daily_recurrence_time = "1900"
  timezone              = "UTC"

  notification_settings {
    enabled         = false
    time_in_minutes = "60"
    webhook_url     = "https://sample-webhook-url.example.com"
  }
}
