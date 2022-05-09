terraform {
  
  required_providers{
      
      random ={
          source = "hashicorp/random"
      }
      azurerm = {
         source = "hashcorp/azurerm"
      }
    }
}

provider "random" {
  
}

provider "azurerm" {
    features{}
  
}