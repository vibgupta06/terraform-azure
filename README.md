# terraform-azure

**Prerequisite:** Install Azure cli, Install terraform cli

az login

terraform init

terraform validate

terraform plan  -var="admin_password=<password>" 

terraform apply

**Output:** It will create a Resource group, a virtual network, a subnet, a network interface card (NIC), a windows 2019 virtual machine and a module based storage account
