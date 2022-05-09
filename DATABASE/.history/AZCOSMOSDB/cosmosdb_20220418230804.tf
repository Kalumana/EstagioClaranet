terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.1.2"
    }
  }
}


provider "azurerm" {
  features{}
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}


resource "azurerm_cosmosdb_account" "cosmosdbaccount" {
  name                = "cosmosdbaccount-tf-${random_integer.ri.result}"
  location            = "northeurope"
  resource_group_name = "Estagio-AK"
  offer_type          = "Standard"
  kind                = "MongoDB"



  enable_automatic_failover = true

  /* (Optional) The capabilities which should be enabled for this Cosmos DB account. 
  Value is a capabilities block as defined below.
   Changing this forces a new resource to be created.*/

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }

  capabilities {
    name = "EnableCassandra"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = "eastus"
    failover_priority = 1
  }

  geo_location {
    location          = azurerm_cosmosdb_account.cosmosdbaccount.location
    failover_priority = 0
  }
}