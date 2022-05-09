

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