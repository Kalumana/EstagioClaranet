provider "azurerm" {
    features {}
}

data "azurerm_key_vault" "getkeyvault" {
  name = "keyvault"
  resource_group_name = "Estagio-AK"
}

data "azurerm_key_vault_secret" "getsecret" {
  name = "secret-terraform"
  key_vault_id = data.azurerm_key_vault.getkeyvault.id
}

output "secret" {
  value = data.azurerm_key_vault_secret.getsecret.value
}