variable "rg_name" {
  type        = string
  description = "The resource group name"
  default     = "my_rg"
}

variable "location" {
  type        = string
  description = "The location of the resource group"
  default     = "westus2"
}

variable "clientId" {
  type = string
}

variable "subscriptionId" {
  type = string
}

variable "clientSecret" {
  type = string
}

variable "tenantId" {
  type = string
}

variable "vnet_name" {
  type    = string
  default = "Ore_vnet"
}

variable "vnet_address" {
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  default = "Ore_subnet"
}

variable "subnet_addr" {
  default = ["10.0.1.0/24"]
}

variable "vm_name" {
  default = "vm_with_terraform"
}
