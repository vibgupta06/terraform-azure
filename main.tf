terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#Craete resource group
resource "azurerm_resource_group" "main" {
    name = "tf-rg-eastus"
    location = "eastus"
}

#Craete Virtual Network
resource "azurerm_virtual_network" "main" {
    name = "tf-vnet-eastus"
    location = azurerm_resource_group.main.location
    resource_group_name = azurerm_resource_group.main.name
    address_space = ["10.0.0.0/16"]
}

#Create subnet
resource "azurerm_subnet" "main"{
    name = "tf-subnet-eastus"
    virtual_network_name = azurerm_virtual_network.main.name
    resource_group_name = azurerm_resource_group.main.name
    address_prefixes = ["10.0.0.0/24"]
}

# Create NIC (Network interface card)
resource "azurerm_network_interface" "internal" {
    name = "tf-nic-internal-eastus"
    location = azurerm_resource_group.main.location
    resource_group_name = azurerm_resource_group.main.name
    ip_configuration {
      name = "internal"
      subnet_id = azurerm_subnet.main.id
      private_ip_address_allocation = "Dynamic"
    }
  
}

#Create a Virtual Machine
resource "azurerm_windows_virtual_machine" "main" {
    name = "tf-vm-eastus"
    resource_group_name = azurerm_resource_group.main.name
    location = azurerm_resource_group.main.location
    size = "Standard_B1s"
    admin_username = "user.admin"
    admin_password = "admin@123"
    network_interface_ids = [
        azurerm_network_interface.internal.id
    ]
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
    source_image_reference {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2019-DataCenter"
      version = "latest"
    }
}

