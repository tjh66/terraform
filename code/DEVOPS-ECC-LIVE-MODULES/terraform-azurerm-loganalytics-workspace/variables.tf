variable "ecc_rg_name"{
type = string
description = "Name of Existing Resource Group"
}
variable "ecc_rg_loc"{
type = string
description = "Location of Existing Resource Group"
default = "UK South"
}
variable "ecc_law_name"{
type = string
description = "Name of the new Loganalytics Workspace"
}
variable "ecc_law_sku" {
type = string
description = "Analytics Workspace SKU default PerGB2018"
default = "PerGB2018"
}
variable "ecc_law_retention" {
type = string
description = "Retention in Days default is 127" 
default = "127"
}