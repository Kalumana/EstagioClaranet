terraform {
     backend "azurerm"{
        resource_group_name = "Estagio-AK"
        storage_account_name = "tfazcloud"
        container_name = "tfcontainer"
        key = "DoEGgRYWxlhbPldkxB3jde9nLK8kFm7DKOOvyC2Vymo/RCqUM8DGTQfphX3QN/dGOOhqdGRoq4lekomXncKjOw=="

  }
}

provider "azurerm" {
    features {}
}


resource "azurerm_resource_group" "rg_state" {
  name = "rg_terraform_com_state"
  location = "northeurope"
  
}

