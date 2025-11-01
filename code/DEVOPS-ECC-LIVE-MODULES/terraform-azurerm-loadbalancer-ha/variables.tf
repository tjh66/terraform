variable "ecc_rg_name"{
type = string
description = "Name of Existing Resource Group"
}
variable "ecc_rg_loc"{
type = string
description = "Location of of Existing Resource Group (Default UK South)"
default = "UK South"
}
variable "ecc_subnet_name"{
type = string
description = "Name of Existing subnet"
}
variable "ecc_vnet_name"{
type = string
description = "Name of existing vNet"
}
variable "ecc_vnet_rg_name"{
type = string
description = "Name of existing vNet Resource Group"
}
variable "ecc_loadbalancer_name"{
type = string
description = "Name of new LoadBalancer"
}
variable "ecc_loadbalancer_sku"{
type = string
description = "LoadBalancer SKU (Default is Standard)"
default = "Standard"
}
variable "ecc_loadbalancer_bep_name"{
type = string
description = "LoadBalancer Backend Pool Name"
}
variable "ecc_loadbalancer_probe_name"{
type = string
description = "LoadBalancer Probe Name"
}
variable "ecc_loadbalancer_probe_portnumber"{
type = string
description = "LoadBalancer Probe Port Number"
}
variable "ecc_loadbalancer_probe_rule_name"{
type = string
description = "LoadBalancer Probe Rule Name"
}
variable "ecc_loadbalancer_frontendIP_name"{
type = string
description = "LoadBalancer Frontend IP Name"
}
variable "ecc_loadbalancer_frontendIP"{
type = string
description = "LoadBalancer Frontend IP Address"
}