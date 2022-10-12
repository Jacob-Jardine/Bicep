param location string
param webAppName string = 'JacobJardineWebApp000001'

module webAppModule 'webapp-windows.bicep' = if (location == 'uksouth') {
  name: 'WebAppDeploy'
  params: {
    webAppName: webAppName
    location: location
    currentAppSettings: list(resourceId('Microsoft.Web/sites/config', webAppName, 'appsettings'), '2022-03-01').properties
    appSettings: {
      Foo: 'Bar'
    }
  }
}

module sqlModule 'sql-server.bicep' = if (location == 'ukwest') {
  name: 'SQLDeploy'
  params: {
    location: location
    administratorLogin: 'SQLAdmin123'
  }
}
