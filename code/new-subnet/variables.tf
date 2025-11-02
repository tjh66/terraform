variable "ecc_rg_name"{
type = string
description = "Name of Existing Resource Group"
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
description = "Subnet prefix"
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
variable "ecc_private_endpoint_network_policies"{
  type = string
  description = "Network policies for the private endpoint subnet default is enabled for both NSG and UDR"
  default = "Enabled"

}
