terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}

provider "azurerm" {
  features {}
subscription_id = "a7d5c3b8-efab-4b08-968f-ce6ca000d194"
  
}