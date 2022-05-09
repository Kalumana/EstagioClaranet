


data "http" "ip_address" {
    url = "https:/api.ipify.org" # Está url indica o nosso ip
    request_headers = {
        accept = "text/plain"
    }
}


### Criar regras de firewall para acesso ao BD

resource "azurerm_mariadb_firewall_rule" "maiadbfirewall" {
  
  name                = "FirewallRule1"
  resource_group_name = "Estagio-AK"
  server_name         =azurerm_mariadb_server.mariadbserver.name  
  start_ip_address    = data.http.ip_address.body 
  end_ip_address      = data.http.ip_address.body 
}

resource "azurerm_mariadb_firewall_rule" "mariadbfirewall-azureservices" {
  
  name                = "AllowAzureServices"
  resource_group_name = "Estagio-AK"
  server_name         =azurerm_mariadb_server.mariadbserver.name
  start_ip_address    = "0.0.0.0" 
  end_ip_address      = "0.0.0.0"

}