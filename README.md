# terraform-azure

# It will create a Resource group, a virtual network, a subnet, a network interface card (NIC), a windows 2019 virtual machine and a module based storage account

Prerequisite: Install Azure cli, Install terraform cli

az login

terraform validate

terraform plan  -var="admin_password=<password>" 

terraform apply
