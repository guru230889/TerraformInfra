
variable "virtual_network_name" {
  description = "The name of the virtual network to create."
  type        = string
  default     = "example-vnet"
  
}
variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
variable "resource_group_name" {
  description = "The name of the resource group to create or use."
  type        = string
  default     = "example-resource-group"
  
}
variable "resource_group_location" {
  description = "The Azure location where the resource group will be created."
  type        = string
  default     = "East US"
  
}