variable "eccrgname"{
type = string
description = "Name of Resource Group or Existing Resource Group"
default = "RGName"
}
variable "eccrgloc"{
type = string
description = "Location of Resource Group or Existing Resource Group"
default = "UK South"
}
variable "eccnsgname"{
type = string
description = "Name of Resource Network Security Group"
default = "xxxxx-nsg"
}