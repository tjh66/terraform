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
description = "MSSQL Read Scale if serverless set to false"
default = "true"
}
variable "ecc_mssql_sku"{
type = string
description = "MSSQL SKU default is serverless"
default = "GP_S_Gen5_2"
}
variable "ecc_mssql_zoneredundant"{
type = string
description = "Database Redundancy default is false"
default = "false"
}