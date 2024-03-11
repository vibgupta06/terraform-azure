# terraform-azure

**Prerequisite:** Install Azure cli, Install terraform cli

az login

terraform init

terraform validate

terraform plan  -var="admin_password=<password>" 

terraform apply

**Output:** It will create a Resource group, a virtual network, a subnet, two network interface cards (NIC) using loops, two  windows 2019 virtual machines with loops and a module based storage account
