resource "azurerm_storage_account" "storage_account" {
  name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location = var.location
  account_tier = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  account_kind = var.storage_account_kind

  network_rules {
    default_action = "Deny"
    ip_rules = var.ip_rule_autorised
    virtual_network_subnet_ids = var.subnet_ids
  }

  tags = var.tags
}

resource "azurerm_storage_container" "storage_account_container" {
  name = var.storage_account_container_name
  storage_account_name = azurerm_storage_account.storage_account.name
  container_access_type = var.container_access_type
}