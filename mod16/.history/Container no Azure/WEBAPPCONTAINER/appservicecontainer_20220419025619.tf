provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "Estagio-AK"
  location = "northeurope"
}

resource "azurerm_app_service_plan" "plan" {
  name                = "appplancontainer"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appservicecontainer" {
  name                = "appservicecontainertf"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
      linux_fx_version = ""
      always_on = true 
   # dotnet_framework_version = "v4.0"
    #scm_type                 = "LocalGit"
  }

### pEGAR OS DADOS NO ACR
  app_settings = {
    "WWBSITES_ENABLE_APP_SERVICE_STORAGE" = false
    "DOCKER_REGIISTRY_SERVER_URL" = ""
    "DOCKER_REGIISTRY_SERVER_USERNAME" = ""
    "DOCKER_REGIISTRY_SERVER_PASSWORD" = ""

  }

  identity {
    type = "SystemAssigned"
  }
/*
  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }*/
}