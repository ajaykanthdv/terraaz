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
      name = "develop"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id                 = "28e1e42a-4438-4c30-9a5f-7d7b488fd883"
  client_id                       = "4813663b-851f-4614-90a7-ef34f0e92b4d"
  client_secret                   = "QZN8Q~lVsEEfDY~wrMe6gHTugCmtNVRx7SzHdcnh"
  tenant_id                       = "84f1e4ea-8554-43e1-8709-f0b8589ea118"
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "1-a0d7d0fe-playground-sandbox"
  location = "westus"
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