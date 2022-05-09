terraform {
    backend "azurerm"{
        resource_group_name = "Estagio-AK"
        storage_account_name = "storageportaltf"
        container_name = "tfcontainer"
       key = "Z0NpXwtnWDlVfR2Va7TLD8/lltH38utOP3B4tX/3h8wHT61gZ5+9sme91rThnET2fdckci339H6KCwZGVQpkTw=="

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