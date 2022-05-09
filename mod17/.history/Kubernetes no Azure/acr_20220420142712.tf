
resource "azurerm_container_registry" "acr" {
  name                = "azureacrregistrytf"
  resource_group_name = var.rg
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

output "admin_name" {
  value = azurerm_container_registry.acr.admin_username
}
output "admin_password" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}
output "admin_url" {
  value = azurerm_container_registry.acr.login_server
}