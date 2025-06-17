variable "resource_group_name" {
  description = "The name of the resource group to create or use."
  type        = string
  default     = "example-resource-group"
  
}

variable "virtual_network_name" {
  description = "The name of the virtual network to create."
  type        = string
  default     = "example-vnet"

}
variable "subnet_name" {
  description = "The name of the subnet to create."
  type        = string
  default     = "example-subnet"

}
variable "address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)
  default     = ["10.0.1.0/24"]

}