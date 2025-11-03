variable "ecc_rg_location" {
  type = string
  description = "Resource Group Location"
}

  variable "ecc_rg_name" {
  type = string
  description = "Resource Group Name"
  }


  variable "ecc_azurerm_storage_account_name" {
  type = string
  description = "New storage account name must start with stac or the deployment will fail"

  validation {
    condition     = can(regex("^stac", var.ecc_azurerm_storage_account_name))
    error_message = "The storage account must start with stac"
  }

}

  variable "ecc_azurerm_storage_account_tier" {
  type = string
  description = "Standard or Premium"
}

  variable "ecc_azurerm_storage_account_replication_type" {
  type = string
  description = "LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
}

  variable "ecc_azurerm_private_endpoint_file_storage_subnet" {
  type = string
  description = "Private endpoint subnet id to be used"
}

  variable "ecc_subresource_names" {
  type = string
  description = "Private endpoint sub resource options are file,blob,table or queue"
}

  variable "ecc_is_hns_enabled" {
  type = string
  description = "Hierarchical Namespace enabled can be used with ADLS_v2 values are true or false"
}

  variable "ecc_account_kind" {
  type = string
  description = "Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2"
}

  variable "ecc_allow_nested_items_to_be_public" {
  type = string
  description = "Allow or disallow nested items within this Account to opt into being public default is false"
  default = "false"
}


  variable "ecc_large_file_share_enabled" {
  type = string
  description = "Are Large File Shares Enabled? true or false"
  }

 variable "ecc_sftp_enabled" {
  type = string
  description = "Is SFTP Enabled? true or false"
  }

 variable "ecc_blob_delete_retention_policy_days" {
  type = number
  description = "Blob retention policy in days default is 7"
  default = 7
  }

 variable "ecc_blob_delete_retention_policy_permanent_delete_enabled" {
  type = bool
  description = "enable blob permanent delete default false"
  default = false
  }

   variable "ecc_container_delete_retention_policy_days" {
  type = number
  description = "Container retention policy number of days default is 7"
  default = 7
  }