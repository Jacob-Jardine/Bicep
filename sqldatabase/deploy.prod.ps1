#Login
az login

#set subscription
az account set --subscription 8b13bcd9-472e-43ed-88b4-315a19f989bd     # Jacob Jardine subscription

#show current account subscriptions and resource groups and prompt before continuing
az account list --output table
az group list --output table

Read-Host -Prompt "Press ENTER key to continue or CTRL+C to quit"

#create resource group
az group create --location uksouth --resource-group rg-webapp004

#show list of account resource groups
az group list --output table

Read-Host -Prompt "Press ENTER key to continue or CTRL+C to quit"

#create web application
# $pwd_secure_string = Read-Host "Enter a Password" -AsSecureString
az deployment group create --resource-group rg-webapp004 --template-file main.bicep --parameters parameters.prod.json administratorLoginPassword=$env:SQL_PASSWORD
