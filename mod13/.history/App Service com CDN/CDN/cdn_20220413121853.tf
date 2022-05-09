terraform {
  backend "azurerm"{}
}

provider "azurerm" {
  features{}
}


resource "azurerm_app_service_plan" "plan" {
  name = var.appplan_name
  location = "northeurope"
  resource_group_name = "Estagio-AK"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appservice" {
    name = var.app_service_name
    location = "northeurope"
    resource_group_name = "Estagio-AK"
    app_service_plan_id = azurerm_app_service_plan.plan.id

 
}


resource "azurerm_cdn_profile" "cdnprofile" {
  name                = "AppServiceCdnProfile"
  location            = "northeurope"
  resource_group_name = "Estagio-AK"
  sku                 = "Standard_Verizon"

  /*tags = {
    environment = "Production"
    cost_center = "MSFT"
  }*/
}

resource "azurerm_cdn_endpoint" "cdnendpoint" {
  name                = "appservicecdntf"
  profile_name        = azurerm_cdn_profile.cdnprofile.name
  location            = azurerm_cdn_profile.cdnprofile.location
  resource_group_name = "Estagio-AK"

  origin {
    name      = azurerm_app_service.appservice.name
    host_name = azurerm_app_service.appservice.default_site_hostname
  }

  delivery_rule {
    name = "EnforceHTTPS"
    order = "1"

    request_body_condition {
      operator = "equal"
      match_values =["HTTP"]
    }

    url_redirect_action {
      redirect_type = "found"
      protocol = "https"
    }
  } 
}