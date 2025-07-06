module "rggroup" {
  source = "../modules/resource_group"

  resource_group_name     = "rg23080"
  resource_group_location = "centralindia"
  
}
module "rggroup1" {
  source = "../modules/resource_group"
  resource_group_name     = "rg_gaurav"
  resource_group_location = "centralindia"
  
}
module "rggroup3" {
  source = "../modules/resource_group"
  resource_group_name     = "rg_hemuu22"
  resource_group_location = "centralindia"
  
}
module "rggroup2" {
  source = "../modules/resource_group"
  resource_group_name     = "rg_gaurav1"
  resource_group_location = "centralindia"
  
}
module "vnett" {
    depends_on = [ module.rggroup ]
  source = "../modules/vnet"

  resource_group_name     = "rg23080"
  resource_group_location = "centralindia"
  virtual_network_name    = "vnet23080"
  address_space           = ["10.0.0.0/16"]
}
module "subnett" {
    depends_on = [ module.vnett ]
  source = "../modules/subnet"

  resource_group_name     = "rg23080"
  virtual_network_name    = "vnet23080"
  subnet_name             = "subnet23080"
  address_prefixes        = ["10.0.1.0/24"]
}
module "public_ip1" {
  depends_on = [ module.subnett ]
  source = "../modules/public_ip"

  public_ip_name            = "publicip23080"
  resource_group_name       = "rg23080"
  resource_group_location   = "centralindia"
  allocation_method         = "Static"
  
}

module "vm12" {
  depends_on = [module.subnett]
  source     = "../modules/virtualmac"

  resource_group_name  = "rg23080"
  resource_group_location = "centralindia"
  virtual_machine_name = "vm23080"
  virtual_machine_size = "Standard_B1s"

  image_publisher      = "Canonical"
  image_offer          = "0001-com-ubuntu-server-focal"
  image_sku            = "20_04-lts"
  image_version        = "latest"
  public_ip_name        = "publicip23080"
  virtual_network_name  = "vnet23080"
  subnet_name           = "subnet23080"
  network_interface_name = "nic23080"
  # admin_username        = "azureuser"
  # admin_password        = "P@ssw0rd123"
  }

module "sqlserver" {
  depends_on = [ module.rggroup ]
 source = "../modules/sqlserver"

  resource_group_name     = "rg23080"
  resource_group_location = "centralindia"
  sql_server_name         = "sqlserver23080"
  # administrator_login      = "sqladmin"             
  # administrator_login_password     = "P@ssw0rd123"
}
module "sqldatabase" {
  depends_on = [ module.sqlserver ]
  source = "../modules/sqldatabase"

  sql_database_name         = "sqldb23080"

}