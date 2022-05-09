provider "azurerm" {
    features {}
}

data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "keyvault" {
    name = "keyvaulttf"
    location = "northeurope"
    resource_group_name = "Estagio-AK"

    tenant_id = data.azurerm_client_config.current.tenant_id
    sku_name = "premium "
    soft_delete_retention_days = 7

    access_policy  {
        key_permission = ["create", "get", "list"]
        object_id = data.azurerm_client_config.current.object_id
        tenant_id = data.azurerm_client_config.current.tenant_id 
        secret_permission = [
          "set",
          "get",
          "delete",
          "purge",
          "recorver"
        ]
        certificate_permissions = [ "list" ]
    } 
}


resource "azurerm_key_vault_secret" "secret" {
    name =   "secret-terrform"
    value = "mysecret@1234"
    key_vault_id = azurerm_key_vault.keyvault.id 
    expiration_date = "2022-12-31"
}

data "azurerm_key_vault_secret" "getsecret" {
  name = "secret-terraform"
  key_vault_id = azurerm_key_vault.keyvault.id 
}

output "secret_value"{
  value = data.azurerm_key_vault_secret.getsecret.value
}

output "keyvault_url" {
    value = azurerm_key_vault.keyvault.vault_uri
}