output "resource_group_id" {
  value = data.azurerm_resource_group.ecc_existing_resource_group.id
}
output "resource_lb_id" {
  value = azurerm_lb.ecc_load_balancer.id
}
output "resource_lb_ip" {
  value = azurerm_lb.ecc_load_balancer.private_ip_address
}
output "resource_lb_ip_allocation" {
  value = azurerm_lb.ecc_load_balancer.frontend_ip_configuration
}
output "resource_lb_backendpool_name" {
  value = azurerm_lb_backend_address_pool.ecc_lb_bap.name
}