output "windowsServer_ip" {
  #value =  azurerm_windows_virtual_machine.main[*].public_ip_address
  value = [for ip in azurerm_windows_virtual_machine.main: ip.private_ip_address]

}