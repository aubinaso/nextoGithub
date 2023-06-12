variable "local_network_gateway_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "gateway_address" {
  description = "Ip adress on the distant vpn appliance"
  type = string
}

variable "onprem_cirds" {
  type = list(string)
  description = "list of onprem"
}

variable "vpn_gateway_name" {
  type = string
}

variable "vpn_gateway_type" {
  type = string
}

variable "vpn_gateway_routing_type" {
  type = string
}

variable "vpn_gateway_public_ip" {
  type = string
}

variable "vnet_id" {
  type = string
  description = "Hub VNET where the VPN should be install"
}

variable "Virtual_network_gateway_address_prefix" {
  type = list(string)
}

variable "tags" {
  type = map(string)
  default = {
    "PoC" = "nexto"
  }
}