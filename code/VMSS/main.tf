# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.82.0"
    }
  }
}

data "azurerm_client_config" "current" {}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

###########################Resource Group Data Source#################################

data "azurerm_resource_group" "ecc_existing_resource_group" {
  name = var.ecc_rg_name
}

output "id" {
  value = data.azurerm_resource_group.ecc_existing_resource_group.id
}

###########################Subnet Data Source#########################################

data "azurerm_subnet" "ecc_existing_subnet" {
  name                 = var.ecc_vm_subnet_name
  virtual_network_name = var.ecc_vm_vnet_name
  resource_group_name  = var.ecc_vm_vnet_rg
}

output "subnet_id" {
  value = data.azurerm_subnet.ecc_existing_subnet.id
}


#########################Create Virtual Machine Scale Set##############################


resource "azurerm_windows_virtual_machine_scale_set" "eccvm" {
  name                        = "${var.ecc_vm_name}-vmss"
  resource_group_name         = data.azurerm_resource_group.ecc_existing_resource_group.name
  location                    = data.azurerm_resource_group.ecc_existing_resource_group.location
  sku                         = var.ecc_vm_size
  instances                   = 3
  admin_username              = "AzureServerSupport"
  admin_password              = var.ecc_vm_pw
  computer_name_prefix        = var.ecc_vm_name
  enable_automatic_updates    = "true"
  provision_vm_agent          = "true"                 
  timezone                    = "GMT Standard Time"
  license_type                = "Windows_Client"
  vtpm_enabled                = "true"
  secure_boot_enabled         = "true"
  tags  = { PatchGroup = var.ecc_patch_grp
            BootType   = "Secure"
          }

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

  network_interface {
    name    = "${var.ecc_vm_name}-nic"
    primary = true

    ip_configuration {
      name      = "IpConfig"
      primary   = true
      subnet_id = data.azurerm_subnet.ecc_existing_subnet.id
    }
  }
  identity {
    type = "SystemAssigned"
  }

  extension{
  name                 = "GuestAttestation"
  publisher            = "Microsoft.Azure.Security.WindowsAttestation"
  type                 = "GuestAttestation"
  type_handler_version = "1.0"

  settings = <<SETTINGS
{
  "commandToExecute": "hostname && uptime"
}
SETTINGS
}


  # Since these can change via auto-scaling outside of Terraform,
  # let's ignore any changes to the number of instances
  lifecycle {
    ignore_changes = [instances]
  }

}

 /* join domain */

 resource "azurerm_virtual_machine_scale_set_extension" "ecc_domain_join" {
  name                 = "join-domain"
 # location             = "UK South"
 # resource_group_name  = "ea-tim-test-rg"
  virtual_machine_scale_set_id    = "/subscriptions/c430a196-889c-4f9c-be20-06d156fbcf6e/resourceGroups/ea-tim-test-rg/providers/Microsoft.Compute/virtualMachineScaleSets/vm001-vmss"
  publisher            = "Microsoft.Compute"
  type                 = "JsonADDomainExtension"
  type_handler_version = "1.3"
  

  settings = <<SETTINGS
    {
        "Name": "Essexcc.local",
        "OUPath": "OU=PowerAutomateVMSS,OU=Virtual Workstations,OU=WaaS - Broad,OU=Computers,OU=ECC10,DC=Essexcc,DC=local",
        "User": "essexcc\\svc-DomainJoin",
        "Restart": "true",
        "Options": "3"
    }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
        "Password": "${var.ecc_pw_join_dom}"
    }
PROTECTED_SETTINGS
depends_on =  [azurerm_windows_virtual_machine_scale_set.eccvm] 
}



resource "azurerm_monitor_autoscale_setting" "main" {
  name                = "autoscale-config"
  resource_group_name = data.azurerm_resource_group.ecc_existing_resource_group.name
  location            = data.azurerm_resource_group.ecc_existing_resource_group.location
  target_resource_id  = azurerm_windows_virtual_machine_scale_set.eccvm.id

  profile {
    name = "AutoScale"

    capacity {
      default = 3
      minimum = 1
      maximum = 5
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.eccvm.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.eccvm.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
}


