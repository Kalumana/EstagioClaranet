

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


##resource is deprecated in version 3.0 of the AzureRM provider and will be removed 
# in version 4.0. Please use the azurerm_mssql_elasticpool resource instead.
resource "azurerm_sql_elasticpool" "sqlelasticpool" {
  name                = "azsqlelasticpooltf"
  resource_group_name = "Estagio-AK"
  location            = "northeurope"
  server_name         = azurerm_sql_server.sqlserver.name
  edition             = "Basic"
  dtu                 = 50
  db_dtu_min          = 0
  db_dtu_max          = 5
  pool_size           = 5000
}