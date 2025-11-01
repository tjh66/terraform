output "resource_group_id" {
  description = "Public IP of EC2 instance"
  value = data.azurerm_resource_group.ecc_existing_resource_group.id
}

output "as_name" {
  description = "Availabilty Set Name"
  value = var.eccasname
}

output "update_domain_count" {
  description = "Availabilty Set Update Domain Count"
  value = azurerm_availability_set.eccas.platform_update_domain_count
}

output "fault_domain_count" {
  description = "Availabilty Set Fault Domain Count"
  value = azurerm_availability_set.eccas.platform_fault_domain_count
}
