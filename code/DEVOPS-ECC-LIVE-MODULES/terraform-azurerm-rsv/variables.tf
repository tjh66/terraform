variable "eccrgname"{
type = string
description = "Name of Existing Resource Group"
}
variable "eccrgloc"{
type = string
description = "Location of Existing Resource Group"
default = "UK South"
}

variable "eccrsvname"{
type = string
description = "Name of RSV"
}

variable "eccrsvsku"{
type = string
description = "RSV SKU Default is Standard"
default = "Standard"
}

variable "eccrsvpublicaccess"{
type = string
description = "Public Network Access Default is false"
default = "false"
}

variable "eccrsvstoragemode"{
type = string
description = "storage type of the Recovery Services Vault. Possible values are GeoRedundant, LocallyRedundant and ZoneRedundant. Defaults to GeoRedundant."
default = "GeoRedundant"
}

variable "eccrsvcrossregion"{
type = string
description = " Is cross region restore enabled for this Vault? Only can be true, when storage_mode_type is GeoRedundant"
default = "true"
}