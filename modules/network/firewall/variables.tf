variable "tags" {
  type = map(string)
  default = {
    "PoC" = "nexto"
  }
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "firewall_name" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "sku_tier" {
  type = string
}

variable "dns_serves" {
  type = list(string)
}

variable "firewall_policy_name" {
  type = string
}