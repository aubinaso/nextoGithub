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

variable "tags" {
  type = map(string)
  default = {
    "PoC" = "nexto"
  }
}