terraform {
    backend "azurerm"{
        #resource_group_name = "Estagio-AK"
        #storage_account_name = "tfazcloud"
        #container_name = "tfcontainer"
       # key = "DoEGgRYWxlhbPldkxB3jde9nLK8kFm7DKOOvyC2Vymo/RCqUM8DGTQfphX3QN/dGOOhqdGRoq4lekomXncKjOw=="

  }
}

provider "azurerm" {
    features {}
}


resource "azurerm_app_service_plan" "plan" {
    name = "appplan-azpipeline"
    location = var.location
    tags = var.tags
    resource_group_name = "Estagio-AK"
    sku {
      size = "F1"
      tier = "Standard"
    }
}


resource "azurerm_app_service" "appservice" {
    name = "azpipeline-tf"
    location = var.location 
    tags = var.tags 
    resource_group_name = "Estagio-AK"
    app_service_plan_id = azurerm_app_service_plan.plan.id
}