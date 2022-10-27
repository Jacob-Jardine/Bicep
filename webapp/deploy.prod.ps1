#Login
az login

#set subscription
az account set --subscription 8b13bcd9-472e-43ed-88b4-315a19f989bd     # Jacob Jardine subscription

#show current account subscriptions and resource groups and prompt before continuing
az account list --output table
az group list --output table

Read-Host -Prompt "Press ENTER key to continue or CTRL+C to quit"

#create resource group
az group create --location uksouth --resource-group rg-webapp002

#show list of account resource groups
az group list --output table

Read-Host -Prompt "Press ENTER key to continue or CTRL+C to quit"

#create web application
az deployment group create --resource-group rg-webapp002 --template-file main.bicep --parameters parameters.prod.json