

resource "azurerm_network_interface" "main1" {
  name                = var.network_interface_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    public_ip_address_id          = data.azurerm_public_ip.public_ip.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "main2" {
  name                            = var.virtual_machine_name
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  size                            = var.virtual_machine_size
  admin_username                  = data.azurerm_key_vault_secret.user.value
  admin_password                  = data.azurerm_key_vault_secret.pass.value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.main1.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher# Published ID from Azure Marketplace
    offer     = var.image_offer     # Product ID from Azure Marketplace
    sku       = var.image_sku       # Plan ID from Azure Marketplace
    version   = var.image_version   # Version of the image
  }
}

