output "windowsServer_public_ip" {
  #value =  azurerm_windows_virtual_machine.main[*].public_ip_address
  value = [for ip in azurerm_windows_virtual_machine.main: ip.public_ip_address]

}