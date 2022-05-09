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

resource "azurerm_container_group" "aci" {
  name                = "aci-site"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"

  ## Esses dados têm que ser pegos no acr
  image_registry_credential {
    username ="" 
    password =""
    server =  ""
  }

  container {
    name   = "acrgistrytf"
    image  = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 443
      protocol = "TCP"
    }

     ports {
      port     = 80
      protocol = "TCP"
    }
  }

/*
  container {
    name   = "sidecar"
    image  = "mcr.microsoft.com/azuredocs/aci-tutorial-sidecar"
    cpu    = "0.5"
    memory = "1.5"
  }

  tags = {
    environment = "testing"
  }*/
}