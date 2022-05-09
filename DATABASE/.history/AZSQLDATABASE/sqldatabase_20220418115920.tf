
provider "azurerm" {
  features{}
}

resource "" "name" {
  
}

resource "azurerm_storage_account" "example" {
  name                     = "examplesa"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_sql_server" "sqlserver" {
  name                         = "mssqlserver"
  resource_group_name          = "Estagio-AK"
  location                     = "northeurope"
  version                      = "12.0"
  administrator_login          = "AdminSqlServer"
  administrator_login_password = "Admin@2022"

  tags = {
   owner = "António Kalumana"
  }
}

resource "azurerm_mssql_database" "mssqldatabase" {
  name           = "db_terraform"
  server_id      = azurerm_sql_server.sqlserver.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
 # max_size_gb    = 4
  #read_scale     = true
  sku_name       = "Basic"
 # zone_redundant = true

}

resource "azurerm_mssql_database" "azsqldatabase" {
  name           = "azsqldb_terraform"
  resource_group_name = "Estagio-AK"
  location = "northeurope"
  server_name = azurerm_sql_server.sqlserver.name

}