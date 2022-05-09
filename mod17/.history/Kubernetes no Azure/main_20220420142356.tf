
provider "azurerm" {
  features {}
}

variable "rg" {
  type = string
  default = "Estagio-AK"
}

variable "location" {
  type = string
  default = "northeurope"
}


