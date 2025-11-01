variable "ecc_rg_name"{
type = string
description = "Name of Resource Group for Storage Account"
}
variable "ecc_rg_loc"{
type = string
description = "Location of Resource Group for Storage Account"
default = "UK South"
}
variable "ecc_stac_name"{
type = string
description = "Name of Resource Storage Account"
}
variable "ecc_stac_subnet_name"{
type = string
description = "Name of subnet to be associated with Firewall Rule Endpoint"
}
variable "ecc_stac_vnet_name"{
type = string
description = "Name of vNet the subnet is accoiated to"
}
variable "ecc_stac_vnet_rg"{
type = string
description = "Name of vNet Resource Group"
}
variable "ecc_stac_account_tier"{
type = string
description = "Storage Account Tier Standard or Premium Default Standard"
default = "Standard"
}
variable "ecc_stac_account_replication"{
type = string
description = "Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZR Default is LRS"
default = "LRS"
}
variable "ecc_stac_hns_enabled"{
type = string
description = "Is Hierarchical Namespace enabled? Default is false"
default = "false"
}
variable "ecc_stac_sftp_enabled"{
type = string
description = "SFTP support requires is_hns_enabled set to true Default is false"
default = "false"
}
variable "ecc_stac_public_access_enabled"{
type = string
description = "Whether the public network access is enabled? Defaults to true. Default is true"
default = "true"
}