terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

resource "random_string" "random_name" {
    length = 6
    special = false
    upper = false
}

resource "azurerm_storage_account" "main" {
  name                     = "${lower(var.storage_account_name)}${random_string.random_name.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}