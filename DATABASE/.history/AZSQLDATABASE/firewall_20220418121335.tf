

data "http" "ip_address" {
    url = "https:/api.ipify.org" # Está url indica o nosso ip
    request_headers = {
        accept = "text/plain"
    }
}



resource "azurerm_sql_firewall_rule" "sqlfirewall" {
  
  name                = "FirewallRule1"
  resource_group_name = "Estagio-AK"
  server_name         =azurerm_sql_server.sqlserver.id
  start_ip_address    = data.http.ip_address.body 
  end_ip_address      = data.http.ip_address.body 
}