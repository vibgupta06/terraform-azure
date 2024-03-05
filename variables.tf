variable "location" {
    type = string
    default = "eastus"
}

variable "address_space" {
    type = string
    default = "10.0.0.0/16"
}

variable "address_prefixes" {
    type = string
    default = "10.0.0.0/24"
}

variable "size" {
    type = string
    default = "Standard_B1s"
}

variable "storage_account_type" {
    type = string
    default = "Standard_LRS"
}

variable "admin_username" {
    type = string
}

variable "admin_password" {
    type = string
}
