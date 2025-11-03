
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.8.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "0823cfa7-7814-434b-abf9-655be3324067"
}

resource "azurerm_resource_group" "ecc_rg_new" {
  name     = "private-dns-zones"
  location = "UK South"

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }
}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_blob" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name 
  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS for blob service"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_file" {
  name                = "privatelink.file.core.windows.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name
 
  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS for file service"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_sql" {
  name                = "privatelink.database.windows.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS for db service"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_kvault" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS for keyvault service"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_queue" {
  name                = "privatelink.queue.core.windows.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS for queue service"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_dfs" {
  name                = "privatelink.dfs.core.windows.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS for dfs service"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_backup_uks" {
  name                = "privatelink.uks.backup.windowsazure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS for backup service uks"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_sbus" {
  name                = "privatelink.servicebus.windows.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS for service bus service"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_automation" {
  name                = "privatelink.azure-automation.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS for Automation Account"
    ServiceName      = "Azure Automation Account"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_openai" {
  name                = "privatelink.openai.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS for Automation Account"
    ServiceName      = "Azure Open AI"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_notebooks" {
  name                = "privatelink.notebooks.azure.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS for notebooks Account"
    ServiceName      = "Azure Open AI"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_azureml" {
  name                = "privatelink.api.azureml.ms"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS for azureml Account"
    ServiceName      = "Azure Open AI"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_cogserv" {
  name                = "privatelink.cognitiveservices.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS for Azure AI services"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_servai" {
  name                = "privatelink.services.ai.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure AI services"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_botserv" {
  name                = "privatelink.directline.botframework.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Bot services"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_botservtoken" {
  name                = "privatelink.token.botframework.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Token Bot services"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

##########To Do Monday

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_adf" {
  name                = "privatelink.adf.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure ADF"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_afs" {
  name                = "privatelink.afs.azure.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure AFS"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_azconfig" {
  name                = "privatelink.azconfig.io"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure AZConfig"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_azure" {
  name                = "privatelink.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_azureapi" {
  name                = "privatelink.azure-api.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Azure API"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_agentsvc" {
  name                = "privatelink.agentsvc.azure-automation.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure agentsvc Automation"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_analysis" {
  name                = "privatelink.analysis.windows.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Analysis"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_cosmos_analytics" {
  name                = "privatelink.analytics.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Cosmos Analytics"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_api_adu" {
  name                = "privatelink.api.adu.microsoft.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure API ADU"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_azurecr" {
  name                = "privatelink.azurecr.io"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure AzureCR"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_azuredatabricks" {
  name                = "privatelink.azuredatabricks.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure azuredatabricks"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_azdevices" {
  name                = "privatelink.azure-devices.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Devices"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_azdevices_prov" {
  name                = "privatelink.azure-devices-provisioning.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Devices Provisioning"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_hdinsight" {
  name                = "privatelink.azurehdinsight.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure HD Insight"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_iotcentral" {
  name                = "privatelink.azureiotcentral.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure IOT Central"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_staticapps" {
  name                = "privatelink.azurestaticapps.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure StaticApps"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_azsynapse" {
  name                = "privatelink.azuresynapse.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Synapse"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_websites" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Web Sites"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_batch" {
  name                = "privatelink.batch.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Batch"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_cassandra_cosmos" {
  name                = "privatelink.cassandra.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Cassandra Cosmos"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

############# To Do Tuesday


resource "azurerm_private_dns_zone" "ecc_p_dns_zone_datafactory" {
  name                = "privatelink.datafactory.azure.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Data Factory"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_dev_synapse" {
  name                = "privatelink.dev.azuresynapse.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Dev Synapse"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_healthcare" {
  name                = "privatelink.dicom.azurehealthcareapis.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Health Care"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_digitaltwins" {
  name                = "privatelink.digitaltwins.azure.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Digital Twins"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_documents" {
  name                = "privatelink.documents.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Documents"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_dp_kubernetesconfiguration" {
  name                = "privatelink.dp.kubernetesconfiguration.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Dp Kubernetesconfiguration"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_eventgrid" {
  name                = "privatelink.eventgrid.azure.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Eventgrid"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_fhir_azurehealthcareapis" {
  name                = "privatelink.fhir.azurehealthcareapis.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure fhir azurehealthcareapis"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_grafana" {
  name                = "privatelink.grafana.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Grafana"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_gremlin_cosmos" {
  name                = "privatelink.gremlin.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Gremlin Cosmos"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_guestconfiguration" {
  name                = "privatelink.guestconfiguration.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Guest Configuration"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_his_arc" {
  name                = "privatelink.his.arc.cazure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure his arc"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_managedhsm" {
  name                = "privatelink.managedhsm.azure.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure managed hsm"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_maria_db" {
  name                = "privatelink.mariadb.database.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Maria DB"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_media" {
  name                = "privatelink.media.azure.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Media"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_mongo_cosmos" {
  name                = "privatelink.mongo.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure mongo cosmos"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_monitor" {
  name                = "privatelink.monitor.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Monitor"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_mysql" {
  name                = "privatelink.mysql.database.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure mysql"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_ods_opinsights" {
  name                = "privatelink.ods.opinsights.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure ods opinsights"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_oms_opinsights" {
  name                = "privatelink.oms.opinsights.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure oms opinsights"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}


resource "azurerm_private_dns_zone" "ecc_p_dns_zone_pbidedicated" {
  name                = "privatelink.pbidedicated.windows.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure pbidedicated"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_postgres_cosmos" {
  name                = "privatelink.postgres.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure postgres cosmos"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_postgres_database" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure postgres database"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_prod_migration_windowsazure" {
  name                = "privatelink.prod.migration.windowsazure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure prod migration windowsazure"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_purview" {
  name                = "privatelink.purview.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Purview"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_purview_service" {
  name                = "privatelink.purview-service.microsoft.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure purview service"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_purviewstudio" {
  name                = "privatelink.purviewstudio.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure purviewstudio"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_redis" {
  name                = "privatelink.redis.azure.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure REDIS"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_redis_cache" {
  name                = "privatelink.redis.cache.windows.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure redis cache"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_redisenterprise_cache" {
  name                = "privatelink.redisenterprise.cache.azure.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure redisenterprise cache"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_search" {
  name                = "privatelink.search.windows.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Search"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_service_signalr" {
  name                = "privatelink.service.signalr.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure service signalr"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_siterecovery" {
  name                = "privatelink.siterecovery.windowsazure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure siterecovery"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_sql_azuresynapse" {
  name                = "privatelink.sql.azuresynapse.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure sql azuresynapse"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_storage_table" {
  name                = "privatelink.table.core.windows.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Storage Table"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_cosmos_table" {
  name                = "privatelink.table.cosmos.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Cosmos Table"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_tip1_pbi" {
  name                = "privatelink.tip1.powerquery.microsoft.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure tip1 PowerBI"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_ts_eventgrid" {
  name                = "privatelink.ts.eventgrid.azure.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure TS EventGrid"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_web_core" {
  name                = "privatelink.web.core.windows.net"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Web Core"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_webpubsub" {
  name                = "privatelink.webpubsub.azure.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure WebPubSub"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_healthcareapis" {
  name                = "privatelink.workspace.azurehealthcareapis.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure healthcareapis"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_wvd" {
  name                = "privatelink.wvd.microsoft.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure WVD"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_global_wvd" {
  name                = "privatelink-global.wvd.microsoft.com"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure Global WVD"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

resource "azurerm_private_dns_zone" "ecc_p_dns_zone_scm_azurewebsites" {
  name                = "scm.privatelink.azurewebsites.net2"
  resource_group_name = azurerm_resource_group.ecc_rg_new.name

  tags = {

    BaseService      = "Yes"
    CostCentre       = "CITS9200"
    Description      = "Private DNS Azure scm azurewebsites"
    ServiceName      = "Azure Private DNS"
    ServiceOwner     = "Cloud Services Team"
    TSSupportingTeam = "Cloud Services Team"

  }

}

/*
####### vNet Link vnetuks023

resource "azurerm_private_dns_zone_virtual_network_link" "vnetukw023" {
  name                  = "vnetuks023-Link"
  registration_enabled  = true
  resource_group_name   = azurerm_resource_group.ecc_rg_new.name
  private_dns_zone_name = azurerm_private_dns_zone.ecc_p_dns_zone_automation.name
  virtual_network_id    = "/subscriptions/c1ca792b-fd70-4f8e-aac1-7b7463945636/resourceGroups/management-vnet/providers/Microsoft.Network/virtualNetworks/vnetuks023"
}

*/