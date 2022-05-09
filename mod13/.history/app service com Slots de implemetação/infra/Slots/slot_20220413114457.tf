terraform {
  backend "azurerm"{}
}

provider "azurerm" {
    features {
      
    }
  
}



resource "azurerm_app_service_plan" "plan" {
  name = "appplan-slots"
  location = "northeurope"
  resource_group_name = "Estagio-AK"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appservice" {
    name = "appserviceslotstf"
    location = "northeurope"
    resource_group_name = "Estagio-AK"
    app_service_plan_id = azurerm_app_service_plan.plan.id

 
}

resource "azurerm_app_service_slot" "slot" {
    name = "stagging"
    location = "northeurope"
    resource_group_name = "Estagio-AK"
    app_service_name = azurerm_app_service.appservice.name
    app_service_plan_id = azurerm_app_service_plan.plan.id
  
}

/*
resource "azurerm_app_service_active_slot" "example" {
  resource_group_name   = azurerm_resource_group.example.name
  app_service_name      = azurerm_app_service.example.name
  app_service_slot_name = azurerm_app_service_slot.example.name
}*/