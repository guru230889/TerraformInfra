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