variable "eccrgname"{
type = string
description = "Name of Resource Group"
default = "RGName"
}
variable "eccrgloc"{
type = string
description = "Location of Resource Group"
default = "UK South"
}
variable "eccvnetname"{
type = string
description = "Name of Resource vNet"
default = "vnet"
}
variable "eccudrname"{
type = string
description = "Name of Resource UDR"
default = "vnet.udr"
}

variable "eccclientid"{
type = string
description = "Client Id"
default = "vnet.udr"
}
variable "eccclientsecret"{
type = string
description = "Client Secret"
default = "vnet.udr"
}