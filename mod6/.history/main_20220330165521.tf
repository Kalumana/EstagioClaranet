terraform {
     backend "azurerm"{
        resource_group_name = "Estagio-AK"
        storage_account_name = "tfstorageaz"
        key = "PDdnon4ZfSXSzNyXikMyuKYYcZbqt841q5pUG+p+he+LJn8CIYIqshLDLf7pLO201KY1NftXe1uUVi4iaKbcbw=="

  }
}

provider "azurerm" {
    features {}
  
}


