data "http" "ip_address" {
    url = "https:/api.ipify.org" # Está url indica o nosso ip
    request_headers = {
        accept = "text/plain"
    }
}


### Criar regras de firewall para acesso ao BD

resource "azurerm_postgresql_firewall_rule" "postgresqlfirewall" {
  
  name                = "FirewallRule1"
  resource_group_name = "Estagio-AK"
  server_name         =azurerm_postgresql_server.postgresqlserver.name 
  start_ip_address    = data.http.ip_address.body 
  end_ip_address      = data.http.ip_address.body 
}

resource "azurerm_postgresql_firewall_rule" "postgresqlfirewall-azureservices" {
  
  name                = "AllowAzureServices"
  resource_group_name = "Estagio-AK"
  server_name         = azurerm_postgresql_server.postgresqlserver.name
  start_ip_address    = "0.0.0.0" 
  end_ip_address      = "0.0.0.0"

}