variable "resource_group_location" {
  type        = string
  description = "Which Azure Region will you deploy to? i.e. eastus or swedencentral. It needs to be the same region as validator and validator2."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "vm_size" {
  type        = string
  description = "Select the size of your Validator - i.e. Standard_F4s_v2 which is a 4 core, 8g RAM costing $123/month"
}

variable "name" {
  type        = string
  description = "Select your validator name - i.e. validator3 - NOT validator1 or validator2"
}
