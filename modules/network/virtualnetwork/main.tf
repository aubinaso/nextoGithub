resource "azurerm_virtual_network" "virtual_network" {
  name = var.virtual_network_name
  location = var.location
  resource_group_name = var.resource_group_name
  address_space = var.virtual_network_address_space

  tags = var.tags
}

resource "azurerm_virtual_network_peering" "virtualpeering1" {
  count = var.peering_number
  name = var.remote_virtual_network_peering_name[count.index].name
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  remote_virtual_network_id = var.remote_virtual_network_peering_name[count.index].remote_id

  allow_forwarded_traffic = true
  allow_gateway_transit = true
}

resource "azurerm_virtual_network_peering" "virtualpeering2" {
  count = var.peering_number
  name = var.remote_virtual_network_peering_name[count.index].remote_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.remote_virtual_network_peering_name[count.index].remote_virtual_network_name
  remote_virtual_network_id = azurerm_virtual_network.virtual_network.id

  allow_forwarded_traffic = true
  allow_gateway_transit = true
  use_remote_gateways = true
}

resource "azurerm_subnet" "subnet" {
  for_each = toset(var.subnet_information)
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  name = each.key.subnet_name
  address_prefixes = each.key.address_prefix

  tags = var.tags
}