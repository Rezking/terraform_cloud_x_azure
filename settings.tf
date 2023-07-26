terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
  client_id = var.clientId
  client_secret = var.clientSecret
  subscription_id = var.subscriptionId
  tenant_id = var.tenantId
}