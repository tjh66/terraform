# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.8.0"
    }
  }
}
provider "azurerm" {
  subscription_id = "0823cfa7-7814-434b-abf9-655be3324067"
  features {}
}

data "azurerm_resource_group" "ecc_ds_rg" {
  name = var.ecc_rg_name
}

#############################Create ASR#################################

resource "azurerm_recovery_services_vault" "eccasr" {
  name                               = var.ecc_asr_name
  location                           = data.azurerm_resource_group.ecc_ds_rg.location
  resource_group_name                = data.azurerm_resource_group.ecc_ds_rg.name
  public_network_access_enabled      = false
  soft_delete_enabled                = true
  storage_mode_type                  = "LocallyRedundant"
  sku                                = var.ecc_asr_sku
}

##############################Backup Policy#############################
###########################bkpol-2i-14d-4w##############################

resource "azurerm_backup_policy_vm" "bkpol-2i-14d-4w" {
  name                          = "bkpol-2i-14d-4w"
  resource_group_name           = data.azurerm_resource_group.ecc_ds_rg.name
  recovery_vault_name           = azurerm_recovery_services_vault.eccasr.name
  instant_restore_retention_days=var.ecc_asr_instant_restore_retention_days
  timezone = "GMT Standard Time"

  backup {
    frequency = "Daily"
   # hour_duration = 0
   # hour_interval = 0
    time      = "20:00"
    weekdays = []
  }

  retention_daily {
    count = 14
  }
    retention_weekly {
    count    = 4
    weekdays = ["Friday"]
  }

}

##############################Backup Policy#############################
###########################bkpol-5i-2w##################################


resource "azurerm_backup_policy_vm" "bkpol-5i-2w" {
  name                = "bkpol-5i-2w"
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  recovery_vault_name = azurerm_recovery_services_vault.eccasr.name
  instant_restore_retention_days = 5
    timezone = "GMT Standard Time"

  backup {
    frequency     = "Weekly"
   # hour_duration = 0
   # hour_interval = 0
    time          = "20:00"
    weekdays      = ["Friday"]
  }
  retention_weekly {
    count    = 2
    weekdays = ["Friday"]
  }

}

##############################Backup Policy#############################
###########################bkpol-2i-14d-4w Enhanced#####################

resource "azurerm_backup_policy_vm" "bkpol-2i-14d-4w-enhanced" {
  name                          = "bkpol-2i-14d-4w-enhanced"
  policy_type                   = "V2"
  resource_group_name           = data.azurerm_resource_group.ecc_ds_rg.name
  recovery_vault_name           = azurerm_recovery_services_vault.eccasr.name
  instant_restore_retention_days=var.ecc_asr_instant_restore_retention_days
  timezone = "GMT Standard Time"

  backup {
    frequency = "Daily"
    time      = "20:00"
    weekdays = []
  }

  retention_daily {
    count = 14
  }
    retention_weekly {
    count    = 4
    weekdays = ["Friday"]
  }

}


##############################Backup Policy#############################
###########################bkpol-5i-2w Enhanced#########################


resource "azurerm_backup_policy_vm" "bkpol-5i-2w-enhanced" {
  name                = "bkpol-5i-2w-enhanced"
  policy_type         = "V2"
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  recovery_vault_name = azurerm_recovery_services_vault.eccasr.name
  instant_restore_retention_days = 5
    timezone = "GMT Standard Time"

  backup {
    frequency     = "Weekly"
    time          = "20:00"
    weekdays      = ["Friday"]
  }
  retention_weekly {
    count    = 2
    weekdays = ["Friday"]
  }
}


##############################Backup Policy#################################
###########################Azure Files bkpol-14d-4w#########################

resource "azurerm_backup_policy_file_share" "azurefiles-bkpol-14d-4w" {
  name                = "azurefiles-bkpol-14d-4w"
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  recovery_vault_name = azurerm_recovery_services_vault.eccasr.name
    timezone = "GMT Standard Time"
  backup {
    frequency = "Daily"
    time      = "19:30"
  }
  retention_daily {
    count = 14
  }
  retention_weekly {
    count    = 4
    weekdays = ["Friday"]
  }

}

resource "azurerm_backup_policy_vm_workload" "SQL_bkpol-sql-1hrlogs-7d" {
  name                = "bkpol-sql-1hrlogs-7d"
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  recovery_vault_name = azurerm_recovery_services_vault.eccasr.name
  workload_type       = "SQLDataBase"
protection_policy {
    policy_type = "Log"
    backup {
      frequency_in_minutes = 60
    }
    simple_retention {
      count = 7
    }
  }
  protection_policy {
    policy_type = "Full"
    backup {
      frequency            = "Daily"
      time                 = "19:00"
    }
    retention_daily {
      count = 7
    }
  }
  settings {
    compression_enabled = true
    time_zone           = "GMT Standard Time"
  }

}

resource "azurerm_backup_policy_vm_workload" "SQL_bkpol-sql-dif-7days" {
  name                = "bkpol-sql-dif-7days"
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  recovery_vault_name = azurerm_recovery_services_vault.eccasr.name
  workload_type       = "SQLDataBase"
 protection_policy {
    policy_type = "Log"
    backup {
      frequency_in_minutes = 60
    }
    simple_retention {
      count = 7
    }
  }
  protection_policy {
    policy_type = "Differential"
    backup {
      frequency            = "Weekly"
      time                 = "07:00"
      weekdays             = ["Friday", "Monday", "Saturday", "Thursday", "Tuesday", "Wednesday"]
    }
    simple_retention {
      count = 7
    }
  }
  protection_policy {
    policy_type = "Full"
    backup {
      frequency            = "Weekly"
      time                 = "19:30"
      weekdays             = ["Sunday"]
    }
    retention_weekly {
      count    = 2
      weekdays = ["Sunday"]
    }
  }
  settings {
    compression_enabled = false
    time_zone           = "GMT Standard Time"
  }

}

resource "azurerm_backup_policy_vm_workload" "SQL_full-bkp-sysdb" {
  name                = "full-bkp-sysdb"
  resource_group_name = data.azurerm_resource_group.ecc_ds_rg.name
  recovery_vault_name = azurerm_recovery_services_vault.eccasr.name
  workload_type       = "SQLDataBase"
protection_policy {
    policy_type = "Full"
    backup {
      frequency            = "Daily"
      time                 = "19:30"
    }
    retention_daily {
      count = 7
    }
  }
  settings {
    compression_enabled = true
    time_zone           = "GMT Standard Time"
  }
}


##############################Replication Policy##############################

resource "azurerm_site_recovery_replication_policy" "eccasrreppolicy" {
  name                                                 = "24-hour-retention-policy"
  resource_group_name                                  = data.azurerm_resource_group.ecc_ds_rg.name
  recovery_vault_name                                  = azurerm_recovery_services_vault.eccasr.name
  recovery_point_retention_in_minutes                  = 24 * 60
  application_consistent_snapshot_frequency_in_minutes = 12 * 60
}

