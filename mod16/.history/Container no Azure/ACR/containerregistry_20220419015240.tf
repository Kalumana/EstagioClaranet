terraform {
 // backend "azurerm" {}
}

provider "azurerm" {
  features {
      }
}

resource "azurerm_resource_group" "rg" {
  name = "Estagio-AK"
  location = "northeurope"
}

resource "azurerm_container_registry" "acr" {
  name                = "containerRegistry1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
 
 /* georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "westeurope"
    zone_redundancy_enabled = true
    tags                    = {}
  }*/
}

output "admin-utilizador" {
  value = azurerm_container_registry.acr.admin_username
}

output "admin-password" {
  value = azurerm_container_registry.acr.admin_password
  sensitive = true
}

output "url" {
  value = azurerm_container_registry.acr.login_server
}