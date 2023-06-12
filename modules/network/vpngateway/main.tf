resource "azurerm_local_network_gateway" "local_network_gateway" {
  name = var.local_network_gateway_name
  resource_group_name = var.resource_group_name
  location = var.location
  gateway_address = var.gateway_address
  address_space = var.onprem_cirds

  tags = var.tags
}

resource "azurerm_public_ip" "vpn_gateway_public_ip" {
  name = var.vpn_gateway_public_ip
  resource_group_name = var.vpn_gateway_name
  location = var.location
  allocation_method = "Static"

  tags = var.tags
}

resource "azurerm_subnet" "gateway_subnet" {
  name = "GatewaySubnet"
  resource_group_name = var.resource_group_name
  address_prefixes = var.Virtual_network_gateway_address_prefix

  tags = var.tags
}

resource "azurerm_virtual_network_gateway" "virtual_network_gateway" {
  name = var.vpn_gateway_name
  location = var.location
  resource_group_name = var.resource_group_name

  type = var.vpn_gateway_type
  vpn_type = var.vpn_gateway_routing_type

  ip_configuration {
    name = "vnetGatewayConfig"
    public_ip_address_id = azurerm_public_ip.vpn_gateway_public_ip.id
    subnet_id = azurerm_subnet.gateway_subnet.id
  }

  tags = var.tags
}