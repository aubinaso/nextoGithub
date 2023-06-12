variable "storage_account_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_account_tier" {
  type = string
  validation {
    condition = contains(["Standard", "Premium", "BlockBlobStorage", "FileStorage"], var.storage_account_tier)
    error_message = "Argument 'account_tier' must be one of 'Standard', 'Premium', 'FileStorage', 'BlockBlobStorage'."
  }
}

variable "storage_account_replication_type" {
  type = string
  validation {
    condition = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.storage_account_replication_type)
    error_message = "Argument 'account_replication_type' must be one of 'LRS', 'ZRS', 'GRS', 'GZRS', 'RAGRS', 'RAGZRS'."
  }
}

variable "storage_account_kind" {
  type = string
  default = "StorageV2"
  validation {
    condition = contains(["BlobStorage", "BlockBlobStorage", "FileStorage", "Storage", "StorageV2"], var.storage_account_kind)
    error_message = "Argument 'account_kind' must be one of 'BlobStorage', 'BlockBlobStorage', 'FileStorage', 'Storage', 'StorageV2'."
  }
}

variable "ip_rule_autorised" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}

variable "storage_account_container_name" {
  type = string
}

variable "container_access_type" {
  type = string
  default = "private"
}

variable "tags" {
  type = map(string)
  default = {
    "PoC" = "nexto"
  }
}
