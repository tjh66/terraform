
data "azurerm_client_config" "current" {}

data "azurerm_subnet" "ecc_subnet_lb" {
  name                 = var.ecc_subnet_name
  virtual_network_name = var.ecc_vnet_name
  resource_group_name  = var.ecc_vnet_rg_name
}

output "subnet_id" {
  value = "${data.azurerm_subnet.ecc_subnet_lb.id}"
}

data "azurerm_resource_group" "ecc_rg" {
  name = var.ecc_rg_name
}

output "id" {
  value = data.azurerm_resource_group.ecc_rg.id
}

resource "azurerm_lb" "ecc_lb" {
  name                = var.ecc_loadbalancer_name
  location            = data.azurerm_resource_group.ecc_rg.location
  resource_group_name = data.azurerm_resource_group.ecc_rg.name
  sku                 = var.ecc_loadbalancer_sku

  frontend_ip_configuration {
    name                          =  var.ecc_loadbalancer_frontendIP_name
    subnet_id                     =  data.azurerm_subnet.ecc_subnet_lb.id
    private_ip_address            =  var.ecc_loadbalancer_frontendIP
    private_ip_address_allocation = "Static"
  }
}

resource "azurerm_lb_backend_address_pool" "ecc_lb_backendpool" {
  loadbalancer_id = azurerm_lb.ecc_lb.id
  name            = var.ecc_loadbalancer_bep_name
}

resource "azurerm_lb_probe" "ecc_lb_probe" {
  name                = var.ecc_loadbalancer_probe_name
  loadbalancer_id     = azurerm_lb.ecc_lb.id
  port                = var.ecc_loadbalancer_probe_portnumber
  interval_in_seconds = 30
}

resource "azurerm_lb_rule" "ecc_lb_probe_rule" {
  name                           = var.ecc_loadbalancer_probe_rule_name
  loadbalancer_id                = azurerm_lb.ecc_lb.id
  protocol                       = "All"
  frontend_port                  = 0
  backend_port                   = 0
  frontend_ip_configuration_name = var.ecc_loadbalancer_frontendIP_name
  

  // Resource defaults as per https://www.terraform.io/docs/providers/azurerm/r/lb_rule.html
  enable_floating_ip      = false
  idle_timeout_in_minutes = 4
  #load_distribution       = "Client IP" // All 5 tuples. Could  be set to  SourceIP or SourceIPProtocol.
  enable_tcp_reset        = false
  disable_outbound_snat   = false
}


