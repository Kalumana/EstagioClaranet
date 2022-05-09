
provider "azurerm" {
  features {}
}

variable "rg" {
  type = string
  value = "Estagio-AK"
}

variable "location" {
  type = string
  value = "northeurope"
}


