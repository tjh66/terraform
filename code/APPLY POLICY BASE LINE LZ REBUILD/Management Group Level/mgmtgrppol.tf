/* 

Base Line Policy Script

Created by Tim Harris / Glyn Howard

Cloud Services

08/2024

*/


# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.86.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = "true"
  features {}
 
}

data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}
data "azurerm_management_group" "ecc_mgmtgrp" {
  name = "Platform"
}

output "display_name" {
  value = data.azurerm_management_group.ecc_mgmtgrp.id
}


############Begin SQL Policies##############


  resource "azurerm_management_group_policy_assignment" "SQL_Postgre_Public_Access_Disabled_FLX" {
  name = "ECC Policy 01"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5e1de0e3-42cb-4ebc-a86d-61d0c619ca48"
  description = "Disabling the public network access property improves security by ensuring your Azure Database for PostgreSQL flexible servers can only be accessed from a private endpoint. This configuration strictly disables access from any public address space outside of Azure IP range and denies all logins that match IP based firewall rules."
  display_name = "pol-public network access should be disabled for PostgreSQL FLX"
  }

  resource "azurerm_management_group_policy_assignment" "Azure_SQL_Database_should_have_Microsoft_Entra-only_authentication_enabled_during_creation" {
  name = "ECC Policy 02"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/abda6d70-9778-44e7-84a8-06713e6db027"
  description = "Require Azure SQL logical servers to be created with Microsoft Entra-only authentication. This policy doesn't block local authentication from being re-enabled on resources after create. Consider using the 'Microsoft Entra-only authentication' initiative instead to require both. Learn more at: https://aka.ms/adonlycreate."
  display_name = "pol-az SQL DB should have Entra-only auth enabled during create"
  }

  resource "azurerm_management_group_policy_assignment" "Az_SQL_MI_should_have_Entra-only_auth_enabled_during_create" {
  name = "ECC Policy 03"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/78215662-041e-49ed-a9dd-5385911b3a1f"
  description = "Require Azure SQL Managed Instance to be created with Microsoft Entra-only authentication. This policy doesn't block local authentication from being re-enabled on resources after create. Consider using the 'Microsoft Entra-only authentication' initiative instead to require both. Learn more at: https://aka.ms/adonlycreate."
  display_name = "pol-az SQL MI should have Entra-only auth enabled during create"
  }

  resource "azurerm_management_group_policy_assignment" "Az_SQL_DB_should_have_MS_Entra-only_auth_enabled" {
  name = "ECC Policy 04"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b3a22bc9-66de-45fb-98fa-00f5df42f41a"
  description = "Require Azure SQL logical servers to use Microsoft Entra-only authentication. This policy doesn't block servers from being created with local authentication enabled. It does block local authentication from being enabled on resources after create. Consider using the 'Microsoft Entra-only authentication' initiative instead to require both. Learn more at: https://aka.ms/adonlycreate."
  display_name = "pol-az SQL DB should have MS Entra-only auth enabled"
  }

  resource "azurerm_management_group_policy_assignment" "Az_SQL_MI_should_have_MS_Entra-only_auth_enabled" {
  name = "ECC Policy 05"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0c28c3fb-c244-42d5-a9bf-f35f2999577b"
  description = "Require Azure SQL Managed Instance to use Microsoft Entra-only authentication. This policy doesn't block Azure SQL Managed instances from being created with local authentication enabled. It does block local authentication from being enabled on resources after create. Consider using the 'Microsoft Entra-only authentication' initiative instead to require both. Learn more at: https://aka.ms/adonlycreate."
  display_name = "pol-az SQL MI should have MS Entra-only auth enabled"
  }

  resource "azurerm_management_group_policy_assignment" "Az_MySQL_flexible_server_should_have_Entra_Only_Auth_enabled" {
  name = "ECC Policy 06"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/40e85574-ef33-47e8-a854-7a65c7500560"
  description = "Disabling local authentication methods and allowing only Microsoft Entra Authentication improves security by ensuring that Azure MySQL flexible server can exclusively be accessed by Microsoft Entra identities."
  display_name = "pol-az MySQL flexible server should have Entra Only Auth enabled"
  }

  resource "azurerm_management_group_policy_assignment" "A_MS_Entra_admin_should_be_provisioned_for_MySQL_servers" {
  name = "ECC Policy 07"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/146412e9-005c-472b-9e48-c87b72ac229e"
  description = "Audit provisioning of a Microsoft Entra administrator for your MySQL server to enable Microsoft Entra authentication. Microsoft Entra authentication enables simplified permission management and centralized identity management of database users and other Microsoft services"
  display_name = "pol-a MS Entra admin should be provisioned for MySQL servers"
  }

  resource "azurerm_management_group_policy_assignment" "A_MS_Entra_admin_should_be_provisioned_for_PostgreSQL_svrs" {
  name = "ECC Policy 08"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b4dec045-250a-48c2-b5cc-e0c4eec8b5b4"
  description = "Audit provisioning of a Microsoft Entra administrator for your PostgreSQL server to enable Microsoft Entra authentication. Microsoft Entra authentication enables simplified permission management and centralized identity management of database users and other Microsoft services"
  display_name = "pol-a MS Entra admin should be provisioned for PostgreSQL svrs"
  }
  
  resource "azurerm_management_group_policy_assignment" "PN_access_should_be_disabled_for_MySQL_flexible_servers" {
  name = "ECC Policy 09"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c9299215-ae47-4f50-9c54-8a392f68a052"
  description = "Disabling the public network access property improves security by ensuring your Azure Database for MySQL flexible servers can only be accessed from a private endpoint. This configuration strictly disables access from any public address space outside of Azure IP range and denies all logins that match IP or virtual network-based firewall rules."
  display_name = "pol-pn access should be disabled for MySQL flexible servers"
  }

  resource "azurerm_management_group_policy_assignment" "SQL_MI_should_have_the_minimal_TLS_version_of_1_2" {
  name = "ECC Policy 10"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a8793640-60f7-487c-b5c3-1d37215905c4"
  description = "Setting minimal TLS version to 1.2 improves security by ensuring your SQL Managed Instance can only be accessed from clients using TLS 1.2. Using versions of TLS less than 1.2 is not recommended since they have well documented security vulnerabilities."
  display_name = "pol-sql mi should have the minimal TLS version of 1.2"
  }
  
  resource "azurerm_management_group_policy_assignment" "Az_SQL_DB_should_be_running_TLS_version_1_2_or_newer" {
  name = "ECC Policy 11"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/32e6bbec-16b6-44c2-be37-c5b672d103cf"
  description = "Setting TLS version to 1.2 or newer improves security by ensuring your Azure SQL Database can only be accessed from clients using TLS 1.2 or newer. Using versions of TLS less than 1.2 is not recommended since they have well documented security vulnerabilities."
  display_name = "pol-az SQL DB should be running TLS version 1.2 or newer"
  }

  resource "azurerm_management_group_policy_assignment" "Vulnerability_assessment_should_be_enabled_on_your_SQL_svrs" {
  name = "ECC Policy 12"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/ef2a8f2a-b3d9-49cd-a8a8-9a3aaaf647d9"
  description = "Audit Azure SQL servers which do not have vulnerability assessment properly configured. Vulnerability assessment can discover, track, and help you remediate potential database vulnerabilities."
  display_name = "pol-vulnerability assessment should be enabled on your SQL svrs"
  }
  
  resource "azurerm_management_group_policy_assignment" "Public_network_access_should_be_disabled_for_MariaDB_servers" {
  name = "ECC Policy 13"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/fdccbe47-f3e3-4213-ad5d-ea459b2fa077"
  description = "Disable the public network access property to improve security and ensure your Azure Database for MariaDB can only be accessed from a private endpoint. This configuration strictly disables access from any public address space outside of Azure IP range, and denies all logins that match IP or virtual network-based firewall rules."
  display_name = "pol-public network access should be disabled for MariaDB servers"
  }

  resource "azurerm_management_group_policy_assignment" "Public_network_access_should_be_disabled_for_MySQL_servers" {
  name = "ECC Policy 14"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/d9844e8a-1437-4aeb-a32c-0c992f056095"
  description = "Disable the public network access property to improve security and ensure your Azure Database for MySQL can only be accessed from a private endpoint. This configuration strictly disables access from any public address space outside of Azure IP range, and denies all logins that match IP or virtual network-based firewall rules."
  display_name = "pol-public network access should be disabled for MySQL servers"
  }
  
  resource "azurerm_management_group_policy_assignment" "PN_access_should_be_disabled_for_PostgreSQL_servers" {
  name = "ECC Policy 15"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b52376f7-9612-48a1-81cd-1ffe4b61032c"
  description = "Disable the public network access property to improve security and ensure your Azure Database for PostgreSQL can only be accessed from a private endpoint. This configuration disables access from any public address space outside of Azure IP range, and denies all logins that match IP or virtual network-based firewall rules."
  display_name = "pol-pn access should be disabled for PostgreSQL servers"
  }

  resource "azurerm_management_group_policy_assignment" "Azure_SQL_MI_should_disable_public_network_access" {
  name = "ECC Policy 16"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9dfea752-dd46-4766-aed1-c355fa93fb91"
  description = "Disabling public network access (public endpoint) on Azure SQL Managed Instances improves security by ensuring that they can only be accessed from inside their virtual networks or via Private Endpoints. To learn more about public network access, visit https://aka.ms/mi-public-endpoint."
  display_name = "pol-azure SQL MI should disable public network access"
  }
  
  resource "azurerm_management_group_policy_assignment" "PN_access_on_Azure_SQL_Database_should_be_disabled" {
  name = "ECC Policy 17"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1b8ca024-1d5c-4dec-8995-b1a932b41780"
  description = "Disabling the public network access property improves security by ensuring your Azure SQL Database can only be accessed from a private endpoint. This configuration denies all logins that match IP or virtual network based firewall rules."
  display_name = "pol-pn access on Azure SQL Database should be disabled"
  }

  resource "azurerm_management_group_policy_assignment" "Vulnerability_assessment_should_be_enabled_on_SQL_MI" {
  name = "ECC Policy 18"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1b7aa243-30e4-4c9e-bca8-d0d3022b634a"
  description = "Audit each SQL Managed Instance which doesn't have recurring vulnerability assessment scans enabled. Vulnerability assessment can discover, track, and help you remediate potential database vulnerabilities."
  display_name = "pol-vulnerability assessment should be enabled on SQL MI"
  }
  
############End SQL Policies##############


############Begin Compute Policies########

  resource "azurerm_management_group_policy_assignment" "VMs_and_virtual_machine_scale_sets_encryption_at_host" {
  name = "ECC Policy 19"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/fc4d8e41-e223-45ea-9bf5-eada37891d87"
  description = "Use encryption at host to get end-to-end encryption for your virtual machine and virtual machine scale set data. Encryption at host enables encryption at rest for your temporary disk and OS/data disk caches. Temporary and ephemeral OS disks are encrypted with platform-managed keys when encryption at host is enabled. OS/data disk caches are encrypted at rest with either customer-managed or platform-managed key, depending on the encryption type selected on the disk. Learn more at https://aka.ms/vm-hbe."
  display_name = "pol-vm's and virtual machine scale sets encryption at host"
  }

  resource "azurerm_management_group_policy_assignment" "Disk_access_resources_should_use_private_link" {
  name = "ECC Policy 20"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/f39f5f49-4abf-44de-8c70-0756997bfb51"
  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to diskAccesses, data leakage risks are reduced. Learn more about private links at: https://aka.ms/disksprivatelinksdoc. "
  display_name = "pol-disk access resources should use private link"
  }


  resource "azurerm_management_group_policy_assignment" "Microsoft_IaaSAntimalware_ext_should_be_deployed_on_VMs" {
  name = "ECC Policy 21"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9b597639-28e4-48eb-b506-56b05d366257"
  description = "This policy audits any Windows server VM without Microsoft IaaSAntimalware extension deployed."
  display_name = "pol-microsoft IaaSAntimalware ext should be deployed on VMs"
  }

  resource "azurerm_management_group_policy_assignment" "Managed_disks_should_disable_public_network_access" {
  name = "ECC Policy 22"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/8405fdab-1faf-48aa-b702-999c9c172094"
  description = "Disabling public network access improves security by ensuring that a managed disk isn't exposed on the public internet. Creating private endpoints can limit exposure of managed disks. Learn more at: https://aka.ms/disksprivatelinksdoc."
  display_name = "pol-managed disks should disable public network access"
  }

  resource "azurerm_management_group_policy_assignment" "VMs_should_be_migrated_to_new_Azure_Resource_Manager" {
  name = "ECC Policy 23"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1d84d5fb-01f6-4d12-ba4f-4a26081d403d"
  description = "Use new Azure Resource Manager for your virtual machines to provide security enhancements such as: stronger access control (RBAC), better auditing, Azure Resource Manager based deployment and governance, access to managed identities, access to key vault for secrets, Azure AD-based authentication and support for tags and resource groups for easier security management"
  display_name = "pol-vm's should be migrated to new Azure Resource Manager"
  }
/*End Compute Policies*/


############Begin Automation Account Policies########

  resource "azurerm_management_group_policy_assignment" "Automation_Account_should_have_Managed_Identity" {
  name = "ECC Policy 24"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/dea83a72-443c-4292-83d5-54a2f98749c0"
  description = "Use Managed Identities as the recommended method for authenticating with Azure resources from the runbooks. Managed identity for authentication is more secure and eliminates the management overhead associated with using RunAs Account in your runbook code ."
  display_name = "pol-automation account should have Managed Identity"
  }

  resource "azurerm_management_group_policy_assignment" "Automation_accounts_should_disable_public_network_access" {
  name = "ECC Policy 25"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/955a914f-bf86-4f0e-acd5-e0766b0efcb6"
  description = "Disabling public network access improves security by ensuring that the resource isn't exposed on the public internet. You can limit exposure of your Automation account resources by creating private endpoints instead. Learn more at: https://docs.microsoft.com/azure/automation/how-to/private-link-security."
  display_name = "pol-automation accounts should disable public network access"
  }

  resource "azurerm_management_group_policy_assignment" "Automation_account_should_have_local_auth_method_disabled" {
  name = "ECC Policy 26"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/48c5f1cb-14ad-4797-8e3b-f78ab3f8d700"
  description = "Disabling local authentication methods improves security by ensuring that Azure Automation accounts exclusively require Azure Active Directory identities for authentication."
  display_name = "pol-automation account should have local auth method disabled"
  }

  resource "azurerm_management_group_policy_assignment" "Automation_account_variables_should_be_encrypted" {
  name = "ECC Policy 27"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/3657f5a0-770e-44a3-b44e-9431ba1e9735"
  description = "It is important to enable encryption of Automation account variable assets when storing sensitive data"
  display_name = "pol-automation account variables should be encrypted"
  }

  resource "azurerm_management_group_policy_assignment" "PEP_connections_on_Automation_Accounts_should_be_enabled" {
  name = "ECC Policy 28"
  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0c2b3618-68a8-4034-a150-ff4abc873462"
  description = "Private endpoint connections allow secure communication by enabling private connectivity to Automation accounts without a need for public IP addresses at the source or destination. Learn more about private endpoints in Azure Automation at https://docs.microsoft.com/azure/automation/how-to/private-link-security"
  display_name = "pol-pep connections on Automation Accounts should be enabled"
  }


############End Automation Account Policies##########

#############################################################################################

  ######### Key Vault Policies #########

  resource "azurerm_management_group_policy_assignment" "Azure_Key_Vault_should_use_RBAC_permission_model" {

  name = "ECC Policy 29"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/12d4fa5e-1f9f-4c21-97a9-b99b3c6611b5"

  description = "Enable RBAC permission model across Key Vaults. Learn more at: https://learn.microsoft.com/en-us/azure/key-vault/general/rbac-migration"

  display_name = "pol-azure Key Vault should use RBAC permission model"

  }


  resource "azurerm_management_group_policy_assignment" "Azure_Key_Vault_should_have_firewall_enabled" {

  name = "ECC Policy 30"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/55615ac9-af46-4a59-874e-391cc3dfb490"

  description = "Enable the key vault firewall so that the key vault is not accessible by default to any public IPs. Optionally, you can configure specific IP ranges to limit access to those networks. Learn more at: https://docs.microsoft.com/azure/key-vault/general/network-security"

  display_name = "pol-azure Key Vault should have firewall enabled"

  }

  resource "azurerm_management_group_policy_assignment" "Azure_Key_Vault_should_disable_public_network_access" {

  name = "ECC Policy 31"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/405c5871-3e91-4644-8a63-58e19d68ff5b"

  description = "Disable public network access for your key vault so that it's not accessible over the public internet. This can reduce data leakage risks. Learn more at: https://aka.ms/akvprivatelink."

  display_name = "pol-azure Key Vault should disable public network access"

  }

  resource "azurerm_management_group_policy_assignment" "Key_vaults_should_have_deletion_protection_enabled" {

  name = "ECC Policy 32"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0b60c0b2-2dc2-4e1c-b5c9-abbed971de53"

  description = "Malicious deletion of a key vault can lead to permanent data loss. You can prevent permanent data loss by enabling purge protection and soft delete. Purge protection protects you from insider attacks by enforcing a mandatory retention period for soft deleted key vaults. No one inside your organization or Microsoft will be able to purge your key vaults during the soft delete retention period. Keep in mind that key vaults created after September 1st 2019 have soft-delete enabled by default."

  display_name = "pol-key vaults should have deletion protection enabled"

  }

  resource "azurerm_management_group_policy_assignment" "Key_vaults_should_have_soft_delete_enabled" {

  name = "ECC Policy 33"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d"

  description = "Deleting a key vault without soft delete enabled permanently deletes all secrets, keys, and certificates stored in the key vault. Accidental deletion of a key vault can lead to permanent data loss. Soft delete allows you to recover an accidentally deleted key vault for a configurable retention period."

  display_name = "pol-key vaults should have soft delete enabled"

  }


   ######### Backup Policies #########

  resource "azurerm_management_group_policy_assignment" "Azure_RSV_should_use_private_link_for_backup" {

  name = "ECC Policy 34"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/deeddb44-9f94-4903-9fa0-081d524406e3"

  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Azure Recovery Services vaults, data leakage risks are reduced. Learn more about private links at: https://aka.ms/AB-PrivateEndpoints."

  display_name = "pol-azure RSV should use private link for backup"

  }

   resource "azurerm_management_group_policy_assignment" "Azure_Backup_should_be_enabled_for_Managed_Disks" {

  name = "ECC Policy 35"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a25a41a7-a769-4271-841d-7ce0297be0c0"

  description = "Ensure protection of your Managed Disks by enabling Azure Backup. Azure Backup is a secure and cost effective data protection solution for Azure."

  display_name = "pol-Azure Backup should be enabled for Managed Disks"

  }

   resource "azurerm_management_group_policy_assignment" "Azure_RSV_should_disable_public_network_access" {

  name = "ECC Policy 36"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9ebbbba3-4d65-4da9-bb67-b22cfaaff090"

  description = "Disabling public network access improves security by ensuring that recovery services vault is not exposed on the public internet. Creating private endpoints can limit exposure of recovery services vault. Learn more at: https://aka.ms/AB-PublicNetworkAccess-Deny."

  display_name = "pol-Azure RSV should disable public network access"

  }

   resource "azurerm_management_group_policy_assignment" "Soft_delete_should_be_enabled_for_Backup_Vaults" {

  name = "ECC Policy 37"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/9798d31d-6028-4dee-8643-46102185c016"

  description = "This policy audits if soft delete is enabled for Backup vaults in the scope. Soft delete can help you recover your data after it has been deleted. Learn more at https://aka.ms/AB-SoftDelete"

  display_name = "pol-Soft delete should be enabled for Backup Vaults"

  }

   resource "azurerm_management_group_policy_assignment" "Azure_Backup_should_be_enabled_for_Blobs_in_Storage_Accounts" {

  name = "ECC Policy 38"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4510daf9-5abc-4d7d-a11d-d84416b814f6"

  description = "Ensure protection of your Storage Accounts by enabling Azure Backup. Azure Backup is a secure and cost effective data protection solution for Azure."

  display_name = "pol-Azure Backup should be enabled for Blobs in Storage Accounts"

  }

   resource "azurerm_management_group_policy_assignment" "Azure_Backup_should_be_enabled_for_Virtual_Machines" {

  name = "ECC Policy 39"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/013e242c-8828-4970-87b3-ab247555486d"

  description = "Ensure protection of your Azure Virtual Machines by enabling Azure Backup. Azure Backup is a secure and cost effective data protection solution for Azure."

  display_name = "pol-Azure Backup should be enabled for Virtual Machines"

  }

######### Storage Policies #########


   resource "azurerm_management_group_policy_assignment" "STAC_should_have_the_specified_minimum_TLS_version" {

  name = "ECC Policy 40"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/fe83a0eb-a853-422d-aac2-1bffd182c5d0"

  description = "Configure a minimum TLS version for secure communication between the client application and the storage account. To minimize security risk, the recommended minimum TLS version is the latest released version, which is currently TLS 1.2."

  display_name = "pol-STAC should have the specified minimum TLS version"

  }

   resource "azurerm_management_group_policy_assignment" "Secure_transfer_to_storage_accounts_should_be_enabled" {

  name = "ECC Policy 41"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/404c3081-a854-4457-ae30-26a93ef643f9"

  description = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"

  display_name = "pol-Secure transfer to storage accounts should be enabled"

  }

   resource "azurerm_management_group_policy_assignment" "STACs_should_allow_access_from_trusted_Microsoft_services" {

  name = "ECC Policy 42"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c9d007d0-c057-4772-b18c-01e546713bcd"

  description = "Some Microsoft services that interact with storage accounts operate from networks that can't be granted access through network rules. To help this type of service work as intended, allow the set of trusted Microsoft services to bypass the network rules. These services will then use strong authentication to access the storage account."

  display_name = "pol-STACs should allow access from trusted Microsoft services"

  }

   resource "azurerm_management_group_policy_assignment" "Storage_accounts_should_disable_public_network_access" {

  name = "ECC Policy 43"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b2982f36-99f2-4db5-8eff-283140c09693"

  description = "To improve the security of Storage Accounts, ensure that they aren't exposed to the public internet and can only be accessed from a private endpoint. Disable the public network access property as described in https://aka.ms/storageaccountpublicnetworkaccess. This option disables access from any public address space outside the Azure IP range, and denies all logins that match IP or virtual network-based firewall rules. This reduces data leakage risks."

  display_name = "pol-Storage accounts should disable public network access"

  }

   resource "azurerm_management_group_policy_assignment" "Storage_accounts_should_restrict_network_access" {

  name = "ECC Policy 44"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/34c877ad-507e-4c82-993e-3452a6e0ad3c"

  description = "Network access to storage accounts should be restricted. Configure network rules so only applications from allowed networks can access the storage account. To allow connections from specific internet or on-premises clients, access can be granted to traffic from specific Azure virtual networks or to public internet IP address ranges"

  display_name = "pol-Storage accounts should restrict network access"

  }

   resource "azurerm_management_group_policy_assignment" "STACs_should_restrict_network_access_using_VNet_rules" {

  name = "ECC Policy 45"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/2a1a9cdf-e04d-429a-8416-3bfb72a1b26f"

  description = "Protect your storage accounts from potential threats using virtual network rules as a preferred method instead of IP-based filtering. Disabling IP-based filtering prevents public IPs from accessing your storage accounts."

  display_name = "pol-STACs should restrict network access using VNet rules"

  }

   resource "azurerm_management_group_policy_assignment" "Storage_accounts_should_use_private_link" {

  name = "ECC Policy 46"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/6edd7eda-6dd8-40f7-810d-67160c639cd9"

  description = "Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your storage account, data leakage risks are reduced. Learn more about private links at - https://aka.ms/azureprivatelinkoverview"

  display_name = "pol-Storage accounts should use private link"

  }

   resource "azurerm_management_group_policy_assignment" "Azure_File_Sync_should_use_private_link" {

  name = "ECC Policy 47"

  management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id

  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1d320205-c6a1-4ac6-873d-46224024e8e2"

  description = "Creating a private endpoint for the indicated Storage Sync Service resource allows you to address your Storage Sync Service resource from within the private IP address space of your organization's network, rather than through the internet-accessible public endpoint. Creating a private endpoint by itself does not disable the public endpoint."

  display_name = "pol-Azure File Sync should use private link"

  }

resource "azurerm_management_group_policy_assignment" "cis" {
name = "ECC Policy 48"
management_group_id  = data.azurerm_management_group.ecc_mgmtgrp.id
policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/c3f5c4d9-9a1d-4a99-85c0-7f93e384d5c5"
description = "The Center for Internet Security (CIS) is a nonprofit entity whose mission is to 'identify, develop, validate, promote, and sustain best practice solutions for cyberdefense.' CIS benchmarks are configuration baselines and best practices for securely configuring a system. These policies address a subset of CIS Microsoft Azure Foundations Benchmark v1.4.0 controls."
display_name = "init-cis-official-v1-4-0"
identity {
type = "SystemAssigned" 
                 }
location = "UK South"

}