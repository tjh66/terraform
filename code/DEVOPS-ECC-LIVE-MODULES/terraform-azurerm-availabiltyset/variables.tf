variable "eccrgname"{
type = string
description = "Name of Existing Resource Group"
}
variable "eccrgloc"{
type = string
description = "Location of Existing Resource Group"
default = "UK South"
}
variable "eccasname"{
type = string
description = "Name of the new Availabilty Set"
}
variable "ecc_update_domain_count"{
type = string
description = "update domain count default=2"
default = "2"
}
variable "ecc_fault_domain_count"{
type = string
description = "fault domain count default=2"
default = "2"
}