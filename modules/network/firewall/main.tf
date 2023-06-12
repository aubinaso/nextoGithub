resource "azurerm_firewall" "firewall" {
  name = var.firewall_name
  location = var.location
  resource_group_name = var.resource_group_name
  sku_name = var.sku_name
  sku_tier = var.sku_tier
  firewall_policy_id = azurerm_firewall_policy.firewall_policy

  dns_servers = var.dns_serves

  ip_configuration {
    name = "firewallconfiguration"
    subnet_id = var.subnet_id
    public_ip_address_id = azurerm_public_ip.firewall_public_ip.id
  }

  tags = var.tags
}

resource "azurerm_firewall_policy" "firewall_policy" {
  name = var.firewall_policy_name
  location = var.location
  resource_group_name = var.resource_group_name

  sku = "Standard"
}

resource "azurerm_public_ip" "firewall_public_ip" {
  name = "firewallPublicIp"
  location = var.location
  resource_group_name = var.resource_group_name
  allocation_method = "Static"
  sku = "Standard"
}

resource "azurerm_public_ip" "managed_firewall_public_ip" {
  name = "managedfirewallPublicIp"
  location = var.location
  resource_group_name = var.resource_group_name
  allocation_method = "Static"
  sku = "Standard"
}