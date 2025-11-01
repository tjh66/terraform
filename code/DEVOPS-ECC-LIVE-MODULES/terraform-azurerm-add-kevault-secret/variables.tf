variable "ecc_rg_name"{
type = string
description = "Name of Resource Group where keyvault exists"
}
variable "ecc_rg_loc"{
type = string
description = "Location of Resource Group where keyvault exists"
default = "UK South"
}
variable "ecc_kv_name"{
type = string
description = "Name of Existing Keyvault"
}
variable "ecc_kv_secret"{
type = string
description = "Name of new secret"
}
variable "ecc_kv_secret_value"{
type = string
description = "New secrets value"
}