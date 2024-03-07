terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#Craete resource group
resource "azurerm_resource_group" "main" {
  name     = "tf-rg-eastus"
  location = var.location
}

#Craete Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = "tf-vnet-eastus"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = [var.address_space]
}

#Create subnet
resource "azurerm_subnet" "main" {
  name                 = "tf-subnet-eastus"
  virtual_network_name = azurerm_virtual_network.main.name
  resource_group_name  = azurerm_resource_group.main.name
  address_prefixes     = [var.address_prefixes]
}

# Create two NIC (Network interface card)
resource "azurerm_network_interface" "internal" {

  for_each = var.vm_map
  name                = "${each.value.name}-nic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
  }

}

#Create two Virtual Machine servers using loops
resource "azurerm_windows_virtual_machine" "main" {
  for_each = var.vm_map
  name                = each.value.name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = each.value.size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [azurerm_network_interface.internal[each.key].id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-DataCenter"
    version   = "latest"
  }
}

