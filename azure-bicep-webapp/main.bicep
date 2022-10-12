param location string

module webAppModule 'webapp-windows.bicep' = if (location == 'uksouth') {
  name: 'WebAppDeploy'
  params: {
    webAppName: uniqueString(resourceGroup().id)
    location: location
  }
}

module sqlModule 'sql-server.bicep' = if (location == 'ukwest') {
  name: 'SQLDeploy'
  params: {
    location: location
    administratorLogin: 'SQLAdmin123'
  }
}
