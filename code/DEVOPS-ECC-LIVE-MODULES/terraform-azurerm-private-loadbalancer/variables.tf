variable "ecc_rg_name"{
type = string
description = "Name of Existing Resource Group"
}
variable "ecc_rg_loc"{
type = string
description = "Location of Resource Group "
default = "UK South"
}
variable "ecc_lb_name"{
type = string
description = "Load Balancer Name"
}
variable "ecc_lb_sku"{
type = string
description = "Load Balancer sku Standard or Basic"
}
variable "ecc_lb_type"{
type = string
description = "Load Balancer Internal"
default = ""
}
variable "ecc_lb_fe_ip_name"{
type = string
description = "Load Balancer front end Name"
}
variable "ecc_lb_fe_ip_subnet"{
type = string
description = "Load Balancer Subnet id example /subscriptions/{subscription}/resourceGroups/{group}/providers/{provider}/virtualNetworks/{network}/subnets/{subnet}"
}
variable "ecc_lb_fe_ip_add_allocation"{
type = string
description = "Load Balancer IP Type Static Only"
default = "Static"
}
variable "ecc_lb_fe_ip_add"{
type = string
description = "Load Balancer IP Address"
}
variable "ecc_lb_bep_name"{
type = string
description = "Load Balancer Backend Pool Name will automatically have -bep suffix"
}