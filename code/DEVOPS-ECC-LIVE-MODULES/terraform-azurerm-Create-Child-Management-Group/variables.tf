variable "ecc_mg_name"{
type = string
description = "Name of New Management Group"
}

variable "ecc_mg_display_name"{
type = string
description = "Display Name of New Management Group"
}

variable "ecc_parent_mg_id"{
type = string
description = "Parent Management Group ID"
default = "/providers/Microsoft.Management/managementGroups/ECC-Dev"
}