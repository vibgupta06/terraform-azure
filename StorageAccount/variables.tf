variable "storage_account_name" {
    type = string
    description = "The storage account name"
  
}

variable "resource_group_name" {
    type = string
    default = "Resource group name"
  
}

variable "location" {
    type = string
    description = "location where the deployments will be created"
  
}