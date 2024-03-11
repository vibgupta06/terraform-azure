
variable "location" {
  type    = string
  default = "eastus"
}

variable "address_space" {
  type    = string
  default = "10.0.0.0/16"
}

variable "address_prefixes" {
  type    = string
  default = "10.0.0.0/24"
}

variable "size" {
  type    = string
  default = "Standard_B1s"
}

variable "storage_account_type" {
  type    = string
  default = "Standard_LRS"
}

variable "admin_username" {
  type = string
  default = "user.admin"
  sensitive = true
}

variable "admin_password" {
  type = string
  sensitive = true
}

variable "vm_map" {
    type = map(object({
      name = string
      size = string
      
    }))
    default = {
      "vm1" = {
        name = "tf-vm1-eastus"
        size = "Standard_B1s"
        
      }
      "vm2" = {
        name = "tf-vm2-eastus"
        size = "Standard_B2s"
        
      }
    }
  
}