Connect-AzAccount



$subscriptionId1 = '8b13bcd9-472e-43ed-88b4-315a19f989bd'
$resourceGroupName = 'web-app-004'
$location1 = 'uksouth'
$templateFile = 'main.bicep'
$templateParameterFile = 'parameters.prod.json'

$pass = Read-Host "Enter a Password" -AsSecureString



Set-AzContext -SubscriptionId $subscriptionId1



New-AzResourceGroup -Name $resourceGroupName -Location $location1



$testErrors = Test-AzResourceGroupDeployment -TemplateFile $templateFile `
                                   -TemplateParameterFile $templateParameterFile `
                                   -ResourceGroupName $resourceGroupName `
                                   -Verbose `
                                   -administratorLoginPassword $pass
if($testErrors.Count -eq 0) {
    New-AzResourceGroupDeployment -TemplateFile $templateFile `
                                   -TemplateParameterFile $templateParameterFile `
                                   -ResourceGroupName $resourceGroupName `
                                   -Verbose `
                                   -administratorLoginPassword $pass
}
else {
    $testErrors | ForEach-Object { Write-Host ($_.Message)}
}