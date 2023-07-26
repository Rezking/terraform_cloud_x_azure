variable "rg_name" {
    type = string
    description = "The resource group name"
    default = "my_rg"
}

variable "location" {
    type = string
    description = "The location of the resource group"
    default = "westus2"
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