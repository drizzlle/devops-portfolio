terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "location" { default = "westeurope" }

resource "azurerm_resource_group" "rg" {
  name     = "devops-feb-rg"
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                     = "devopsfebsa12345"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

output "rg_name" { value = azurerm_resource_group.rg.name }