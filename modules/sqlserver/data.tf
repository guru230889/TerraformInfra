data "azurerm_key_vault" "KV" {
  name                = "myKeyvault2308"
  resource_group_name = "infrarg"
}


data "azurerm_key_vault_secret" "username" {
  name         = "dbusername"
  key_vault_id = data.azurerm_key_vault.KV.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "dbpass"
  key_vault_id = data.azurerm_key_vault.KV.id
}

