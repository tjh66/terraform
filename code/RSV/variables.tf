variable "ecc_rg_name"{
type = string
description = "Name of Existing Resource Group"
}
variable "ecc_rg_loc"{
type = string
description = "Location of Existing Resource Group"
default = "UK South"
}
variable "ecc_asr_name"{
type = string
description = "Name of ASR/RSV Resource"
}
variable "ecc_asr_sku"{
type = string
description = "ASR SKU values are Standard"
default = "Standard"
}
variable "ecc_asr_instant_restore_retention_days"{
type = number
description = "instant restore retention days default is 2"
default = 2
}




