
variable "ecc_rg_name"{
type = string
description = "Name of Containing Resource Group"
}

variable "ecc_rg_loc"{
type = string
description = "Location of Existing Resource Group"
default = "UK South"
}
variable "ecc_new_subnet_name"{
type = string
description = "Name of new Subnet"
}
variable "ecc_new_subnet_prefix"{
type = string
description = "New Subnet prefix"
}
variable "ecc_existing_vnet"{
type = string
description = "Name of Existing vNet to apply the new subnet to"
}
variable "ecc_existing_vnet_rg"{
type = string
description = "Name of Existing vNet Resource Group to apply the new subnet to"
}
variable "ecc_existing_udr"{
type = string
description = "Name of Existing UDR to attach the Subnet to"
}





variable "ecc_tags" {
  description = "A mapping of tags which should be assigned to the Resource Group or resource."
  type        = map(string)
  default     = {"Agreement" : "EA", "BaseService" : "No","CostCentre" : "CITS9200","Description" : "Default","ServiceName" : "Automation Account","ServiceOwner" : "Default","TSSupportingTeam" : "Cloud Services Team"}
}

