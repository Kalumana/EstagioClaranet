
provider "azurerm" {
  features{}
}


resource "azurerm_mysql_server" "mysqlserver" {
  name                = "mysqldbservertf"
  location            = "northeurope"
  resource_group_name = "Estagio-AK"

  administrator_login          = "adminmysqldb"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"
  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}


resource "azurerm_mysql_database" "mysqldb"{
    name = "mysqldbtf"
    resource_group_name = "Estagio-AK"
    server_name = azurerm_mysql_server.mysqlserver.name 
    charset = "utf8"
    collation = "utf8_general_ci"
}

