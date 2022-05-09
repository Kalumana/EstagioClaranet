
provider "azurerm" {
  features{}
}


resource "azurerm_mariadb_server" "mariadbserver" {
  name                = "mariadb-server"
  location            = "northeurope"
  resource_group_name = "Estagio-AK"

  administrator_login          = "mariadbadmin"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "10.2"

  auto_grow_enabled             = true
  backup_retention_days         = 7
  geo_redundant_backup_enabled  = false
  public_network_access_enabled = false
  # ssl_enforcement_enabled       = true
}

resource "azurerm_mariadb_database" "mariadb" {
  name                = "mariadb_database"
  resource_group_name = "Estagio-AK"
  server_name         = azurerm_mariadb_server.mariadbserver.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}