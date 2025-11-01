
variable "ecc_rg_name"{
type = string
description = "Name of Existing Resource Group"
}

variable "ecc_rg_loc"{
type = string
description = "Location of Existing Resource Group "
default = "UK South"
}

variable "ecc_auto_sku"{
type = string
description = "Automation account SKU Default is Basic"
default = "Basic"
}


variable "ecc_auto_name"{
type = string
description = "Name of new automation account"
}


