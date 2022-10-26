# Bicep Templates

## Deploy bicep file to Azure:

```
New-AzResourceGroupDeployment -ResourceGroupName <resource-group-name> -TemplateFile <path-to-bicep>
```

## Web App Example
```
New-AzResourceGroupDeployment -ResourceGroupName web-app-rg -TemplateFile  C:\Users\Jacob-PC\source\Bicep\Web-App\webapp.bicep -TemplateParameterFile  C:\Users\Jacob-PC\source\Bicep\Web-App\parameters.json
```