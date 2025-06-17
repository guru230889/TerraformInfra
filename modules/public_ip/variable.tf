variable "public_ip_name" {
  
}
variable "resource_group_name" {
  description = "The name of the resource group where the public IP will be created."
  type        = string
  default     = "example-resource-group"
  
}
variable "resource_group_location" {
  description = "The Azure location where the resource group will be created."
  type        = string
  default     = "East US"
  
}
variable "allocation_method" {
  description = "The allocation method for the public IP address."
  type        = string
  default     = "Static"
}