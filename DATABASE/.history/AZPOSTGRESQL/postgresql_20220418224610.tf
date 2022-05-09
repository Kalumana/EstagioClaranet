provider "azurerm" {
  features{}
}


resource "azurerm_postgresql_server" "postgresqlserver" {
  name                = "postgresqldbservertf"
  location            = "northeurope"
  resource_group_name = "Estagio-AK"

  administrator_login          = "adminpostgresqldb"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_4"
  storage_mb = 640000
  version    = "9.6"
  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}


resource "azurerm_postgresql_database" "postgresqldb"{
    name = "postgresqldbtf"
    resource_group_name = "Estagio-AK"
    server_name = azurerm_postgresql_server.postgresqlserver.name
    charset = "utf8"
    collation = "utf8_general_ci"
}
