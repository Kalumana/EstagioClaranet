
resource "azurerm_app_service_plan" "AppPlan" {
    name = "appserviceplan${lower(var.ambiente)}"
    location = var.location
    resource_group_name = "Estagio-AK"
   
    sku {
      tier = "Standard"
      size = "S1"
    }
  
}

resource "azurerm_app_service" "appservice" {
  name = "tfappservicem${lower(var.ambiente)}"
  location = var.location
  resource_group_name = "Estagio-AK"
  app_service_plan_id = azurerm_app_service_plan.AppPlan.id

  site_config {
    dotnet_framework_version = "v4.0"
  }
  app_settings = {
    "key" = "123456"
  }
}

