  terraform {
  required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = ">= 2.96.0"
      }
  }
  }

  provider "azurerm" {
    features {}
  }

data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}


resource "azurerm_subscription_policy_assignment" "InheritTagBaseService" { # change name
  name                 = "inherit a tag from the resource group if missing (BaseService)"   #change this
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9ea02ca2-71db-412d-8b00-7c7ca9fcd32d"
  subscription_id      = data.azurerm_subscription.current.id
  display_name         = "pol-inherit a tag from the resource group if missing (BaseService)"
  location = "uksouth"

identity {
type  =  "SystemAssigned"
}


    parameters = <<PARAMETERS
 {
      "tagName": {
      "value": "BaseService" 
      }
  }
PARAMETERS
}


resource "azurerm_subscription_policy_assignment" "InheritTagServiceName" { # change name
  name                 = "inherit a tag from the resource group if missing (ServiceName)"   #change this
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9ea02ca2-71db-412d-8b00-7c7ca9fcd32d"
  subscription_id      = data.azurerm_subscription.current.id
  display_name         = "pol-inherit a tag from the resource group if missing (ServiceName)"
  location = "uksouth"

identity {
type  =  "SystemAssigned"
}


    parameters = <<PARAMETERS
 {
      "tagName": {
      "value": "ServiceName" 
      }
  }
PARAMETERS
}


resource "azurerm_subscription_policy_assignment" "InheritTagDescription" { # change name
  name                 = "inherit a tag from the resource group if missing (Description)"   #change this
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9ea02ca2-71db-412d-8b00-7c7ca9fcd32d"
  subscription_id      = data.azurerm_subscription.current.id
  display_name         = "pol-inherit a tag from the resource group if missing (Description)"
  location = "uksouth"

identity {
type  =  "SystemAssigned"
}


    parameters = <<PARAMETERS
 {
      "tagName": {
      "value": "Description" 
      }
  }
PARAMETERS
}


resource "azurerm_subscription_policy_assignment" "InheritTagCostCentre" { # change name
  name                 = "inherit a tag from the resource group if missing (CostCentre)"   #change this
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9ea02ca2-71db-412d-8b00-7c7ca9fcd32d"
  subscription_id      = data.azurerm_subscription.current.id
  display_name         = "pol-inherit a tag from the resource group if missing (CostCentre)"
  location = "uksouth"

identity {
type  =  "SystemAssigned"
}


    parameters = <<PARAMETERS
 {
      "tagName": {
      "value": "CostCentre" 
      }
  }
PARAMETERS
}


resource "azurerm_subscription_policy_assignment" "InheritTagServiceOwner" { # change name
  name                 = "inherit a tag from the resource group if missing (ServiceOwner)"   #change this
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9ea02ca2-71db-412d-8b00-7c7ca9fcd32d"
  subscription_id      = data.azurerm_subscription.current.id
  display_name         = "pol-inherit a tag from the resource group if missing (ServiceOwner)"
  location = "uksouth"

identity {
type  =  "SystemAssigned"
}


    parameters = <<PARAMETERS
 {
      "tagName": {
      "value": "ServiceOwner" 
      }
  }
PARAMETERS
}


resource "azurerm_subscription_policy_assignment" "InheritTagTSSupportingTeam" { # change name
  name                 = "inherit a tag from the resource group if missing (TSSupport)"   #change this
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9ea02ca2-71db-412d-8b00-7c7ca9fcd32d"
  subscription_id      = data.azurerm_subscription.current.id
  display_name         = "pol-inherit a tag from the resource group if missing (TSSupportingTeam)"
  location = "uksouth"

identity {
type  =  "SystemAssigned"
}


    parameters = <<PARAMETERS
 {
      "tagName": {
      "value": "TSSupportingTeam" 
      }
  }
PARAMETERS
}


resource "azurerm_subscription_policy_assignment" "AllowedLocationsRG" { # change name
  name                 = "pol-allowed locations"   #change this
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e765b5de-1225-4ba3-bd56-1ac6695af988"
  subscription_id      = data.azurerm_subscription.current.id
  display_name         = "pol-allowed locations"
  location = "uksouth"

identity {
type  =  "SystemAssigned"
}


  parameters = jsonencode({
    listOfAllowedLocations = {
      value = ["eastus", "uksouth","ukwest"]
    }
  })
}


resource "azurerm_subscription_policy_assignment" "cis" {
 name = "CIS Microsoft Azure Foundations Benchmark v1.4.0"
 subscription_id = data.azurerm_subscription.current.id
 policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/c3f5c4d9-9a1d-4a99-85c0-7f93e384d5c5"
 description = "The Center for Internet Security (CIS) is a nonprofit entity whose mission is to 'identify, develop, validate, promote, and sustain best practice solutions for cyberdefense.' CIS benchmarks are configuration baselines and best practices for securely configuring a system. These policies address a subset of CIS Microsoft Azure Foundations Benchmark v1.4.0 controls."
 display_name = "init-cis-official-v1-4-0"
 identity {
 type = "SystemAssigned" 
                 }
 location = "UK South"

   }


     resource "azurerm_subscription_policy_assignment" "nhs" {
  name = "UK OFFICIAL and UK NHS"
  subscription_id = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/3937f550-eedd-4639-9c5e-294358be442e"
  description = "This initiative includes audit and virtual machine extension deployment policies that address a subset of UK OFFICIAL and UK NHS controls. Additional policies will be added in upcoming releases. For more information, visit https://aka.ms/ukofficial-init and https://aka.ms/uknhs-init."
  display_name = "init-uk-official-and-uk-nhs"

identity {
  type = "SystemAssigned" 
  }
location = "UK South"
  }


  resource "azurerm_subscription_policy_assignment" "iso20072013" {
  name = "ISO 27001 2013"
  subscription_id = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/89c6cddc-1c73-4ac1-b19c-54d1a15a42f2"
  description = "The International Organization for Standardization (ISO) 27001 standard provides requirements for establishing, implementing, maintaining, and continuously improving an Information Security Management System (ISMS). These policies address a subset of ISO 27001:2013 controls. Additional policies will be added in upcoming releases. For more information, visit https://aka.ms/iso27001-init"
  display_name = "init-is0 27001:2013"

identity {
  type = "SystemAssigned" 
  }
  location = "UK South"
  }
