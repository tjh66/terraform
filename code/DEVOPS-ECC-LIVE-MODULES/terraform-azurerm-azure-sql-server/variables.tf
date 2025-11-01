variable "ecc_rg_name"{
type = string
description = "Name of Existing Resource Group"
}
variable "ecc_rg_loc"{
type = string
description = "Location of Resource Group "
default = "UK South"
}
variable "ecc_sqlserver_name"{
type = string
description = "SQL server name"
}
variable "ecc_sqlserver_admin"{
type = string
description = "SQL server admin account"
default = "Azuresqlserversupport"
}
variable "ecc_sqlserver_pw"{
type = string
description = "SQL Server Password (must be deferred)"
}