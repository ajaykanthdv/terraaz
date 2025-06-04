terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  cloud {

    organization = "infra_ajay"

    workspaces {
      name = "test1"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id                 = "0cfe2870-d256-4119-b0a3-16293ac11bdc"
  client_id                       = "8a569dac-3611-40bb-9a77-25d11bc2a48c"
  client_secret                   = "Ux18Q~StnYml_kXqUTj3pFU7LrRo~mEphVP4oaFg"
  tenant_id                       = "84f1e4ea-8554-43e1-8709-f0b8589ea118"
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "1-17ea5dc0-playground-sandbox"
  location = "southcentralus"
}

resource "azurerm_storage_account" "storage" {
  name                     = "ajayterrab"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = "playground"
    owner       = "kloud"
  }
}
resource "azurerm_storage_account" "storage" {
  name                     = "ajayterrac"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "playground"
    owner       = "kloud"
  }

}
