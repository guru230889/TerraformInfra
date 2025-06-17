data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}
data "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
}
data "azurerm_key_vault" "KV" {
  name                = "myKeyvault2308"
  resource_group_name = "infrarg"
}
data "azurerm_key_vault_secret" "user" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.KV.id
}
data "azurerm_key_vault_secret" "pass" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.KV.id
}