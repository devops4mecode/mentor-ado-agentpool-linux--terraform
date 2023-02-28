# Automatically create new Agent (self-hosted) Ubuntu Server for Azure DevOps(ADO) via Terraform

## What will be deployed via Terraform?
- Resource Group to where all related Azure DevOps self-hosted agent resources will be situated
- Virtual Network (vNet)
- Key Vault & Secret Generated (In this example; I will use password authentication for ssh access)
- Virtual Machine & additional configuration for setup of Azure DevOps self-hosted agent
- Network Security Group (NSG)

## What custom ado-agent.sh do?:
- Creates directory & download ADO agent install files
- Perform unattended install
- Configure the agent pool to run as a service
- Start the ADO Agent service
- Start to initiate Terraform

## Prerequisites:
- Azure DevOps Organization URL.
- Azure DevOps Organization new/existing Agent Pools.
- Azure DevOps Personal Access Token (PAT); you can see the documented [PAT](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/v2-linux?view=azure-devops#authenticate-with-a-personal-access-token-pat) & for now, keep the PAT at your device 1st)
- Azure Cloud Account

## Steps

### To Use
- Change the values of parameter in "ado.tfvars.sample" file and rename to "ado.tfvars"
- Review "ado-agent.sh", update PAT token as we generated earlier.

`terraform init`
- Validate and check your terraform format:
`terraform validate && terraform fmt`
- Create a Terraform Plan
`terraform plan` OR `terraform plan -out=tfplan`
- After confirmed and validated your parameter, execute command below to create new Azure DevOps Agent.
`terraform apply -auto-approve -var-file=ado.tfvar` OR `terraform apply tfplan -var-file=ado.tfvar`

### To Test New Agent Pool
- Use 'pipeline.yaml' as our sample Build(CI) pipeline script

### Clean Up
- To clean up all the resources provisoned by Terraform , run command below:
`terraform destroy -auto-approve -var-file=ado.tfvar` 