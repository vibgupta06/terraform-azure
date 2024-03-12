terraform init: This command initializes terraform and make it ready for next commands.

terraform plan -out s.plan : This command plans out the configuration file and list out what all resources will be created/updated/replaced/deleted

terraform workspace list: This command lists all the workspaces

terraform workspace show: This command shows current selected workspace

terraform workspace select <workspace name>: This selects the workspace

terraform plan: It list the plan for the resources to be deployed as per the configuration

terraform apply: It deploys the resources, asks for a confirmation.

terraform graph: It generated a diagraph based on the plan

terraform show: It displays the current state of deployed resources

terraform destroy: It deletes all the deployed resources from the cloud

terraform validate: It validates syntax in configuration file

terraform state list : It lists all the resources cuurently deployed by terraform

terraform destroy --target <resource name from the state list cmd> : It destroys the specific resource tied to the provided target value
