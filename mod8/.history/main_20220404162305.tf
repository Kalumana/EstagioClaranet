provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "rg" {
  name = "Estagio-AK"
  location = "northeurope"
  tags = {
    "owner" = "António Kalumana"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name = "Estagio-AK-vnet"
  resource_group_name = "Estagio-AK"
  location = "northeurope"
  address_space = ["10.0.0.0/16", "192.168.0.0/16"]
  tags = {
    "owner" = "test"
  }
}