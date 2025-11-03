variable "ecc_mssql_name"{
type = string
description = "Name of Existing MSSQL Server"
}
variable "ecc_mssql_rg_name"{
type = string
description = "Name of Existing MSSQL Server Resource Group"
}
variable "ecc_mssql_db"{
type = string
description = "Database Name"
default = "UK South"
}
variable "ecc_mssql_db_collation"{
type = string
description = "SQL server db collation"
default = "SQL_Latin1_General_CP1_CI_AS"
}
variable "ecc_mssql_licence_type"{
type = string
description = "mssql licence type"
default = "LicenseIncluded"
}
variable "ecc_mssql_maxsizedb"{
type = string
description = "Maximum Database Size"
}
variable "ecc_mssql_readscale"{
type = string
description = "MSSQL Read Scale"
default = "true"
}
variable "ecc_mssql_sku"{
type = string
description = "MSSQL SKU - Examples GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100"
default = "GP_Gen5_2"
}
variable "ecc_mssql_zoneredundant"{
type = string
description = "Database Redundancy only settable for Premium and Business Critical databases"
default = "false"
}
variable "ecc_storage_backup_type"{
type = string
description = "Possible values are Geo, Local and Zone"
default = "Local"
}
variable "ecc_auto_pause_delay" {
type = number
description = "Pause after amount of minutes 0 is default and means disabled only used with serverless"
default = 0
}