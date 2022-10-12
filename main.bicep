param location string = resourceGroup().location

module webAppModule './azure-bicep-webapp/webapp-windows.bicep' = {
  name: 'WebAppDeploy'
  params: {
    webAppName: uniqueString(resourceGroup().id)
    location: location
  }
}
