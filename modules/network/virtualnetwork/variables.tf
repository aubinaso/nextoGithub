variable "tags" {
  type = map(string)
  default = {
    "PoC" = "nexto"
  }
}

variable "virtual_network_name" {
  type = string
}

variable "peering_number" {
  description = "Nombre de peering"
  type = number
}

variable "remote_virtual_network_peering_name" {
  type = list(map(string))
  default = [ {
    "name" = "value"
    "remote_id" = ""
    "remote_name" = ""
    "remote_virtual_network_name" = ""
  } ]
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "virtual_network_address_space" {
  type = list(string)
}

variable "subnet_name" {
  type = list(map(string))
}

variable "subnet_information" {
  type = list(map(string))
  default = [ {
    "subnet_name" = ""
    "address_prefix" = ""
  } ]
}