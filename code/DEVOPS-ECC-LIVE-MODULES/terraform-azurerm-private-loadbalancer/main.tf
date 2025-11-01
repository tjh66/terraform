data "azurerm_resource_group" "ecc_existing_resource_group" {
  name = var.ecc_rg_name
}
resource "azurerm_lb" "ecc_load_balancer" {
  name                = var.ecc_lb_name
  location            = data.azurerm_resource_group.ecc_existing_resource_group.location
  resource_group_name = data.azurerm_resource_group.ecc_existing_resource_group.name
  sku                 = var.ecc_lb_sku


  frontend_ip_configuration {
    name                          = var.ecc_lb_fe_ip_name
    subnet_id                     = var.ecc_lb_fe_ip_subnet
    private_ip_address_allocation = var.ecc_lb_fe_ip_add_allocation
    private_ip_address = var.ecc_lb_fe_ip_add
  }
}

resource "azurerm_lb_backend_address_pool" "ecc_lb_bep" {
  loadbalancer_id = azurerm_lb.ecc_load_balancer.id
  name            = "${var.ecc_lb_bep_name}-bep"
  
}
