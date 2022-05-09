terraform {
  backend "azurerm"{
      resource_group_name = "Estagio-AK"
      storage_account_name ="tfazcloud"
      container_name = "tfcontainer"
      key = "6jblmRVHVuJfHLdd5gdfVYw5bFy5fAHSnsad7tf2hjo0CZ2Q79+CL6W83j8XElLEMgzTFm3cIErnSAHkIypfMA=="
  }
}

provider "azurerm" {
  features {
    
  }
}

variable "location" {
  type = string
  default = "northeurope"
}

resource "azurerm_app_service_plan" "plan" {
    name = "appserviceplan${lower(terraform.workspace)}"
    location = var.location
    resource_group_name = "Estagio-AK"
   
    sku {
      tier = "Standard"
      size = "S1"
    }
  
}

resource "azurerm_app_service" "appservice" {
  name = "tfappservicem-${lower(terraform.workspace)}"
  location = var.location
  resource_group_name = "Estagio-AK"
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    dotnet_framework_version = "v4.0"
  }
  app_settings = {
    "key" = "123456"
  }
}

