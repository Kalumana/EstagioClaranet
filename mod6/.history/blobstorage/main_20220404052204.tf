terraform {
  
  required_providers{
      
      random ={
          source = "hashicorp/random"
          version = "3.1.2"
      }

      azurerm = {
         source = "hashicorp/azurerm"
         version = "3.0.2"
      }
    }
}

provider "random" {
  
}

provider "azurerm" {
    features{}
  
}

resource "random_string" "random" {
  length = 3
  special = false 
  upper = false 
  number = true 
}

resource "azurerm_storage_account" "storagetf" {
    name = "tftreinamento${random_string.random.result}"
    resource_group_name = "Estagio-AK"
    location = "westeurope"
    account_tier = "Standard"
    access_tier = "Hot"
    account_replication_type = "LRS"
  
}

resource "azurerm_storage_container" "container" {
    name ="terraform"
    storage_account_name = azurerm_storage_account.storagetf.name
    depends_on = [
      azurerm_storage_account.storagetf
    ]
}

output "blobstorage-name" {
    value = azurerm_storage_account.storagetf.name
    
}

output "blobstorage-chave-primaria" {
  value = azurerm_storage_account.storagetf.primary_access_key
}
output "blobstorage-chave-secundaria" {
  value = azurerm_storage_account.storagetf.secondary_access_key
}

