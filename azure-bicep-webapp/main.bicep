param location string
param webAppName string = 'JacobJardineTestSite001'

module webAppModule 'webapp-windows.bicep' = if (location == 'uksouth') {
  name: 'WebAppDeploy'
  params: {
    webAppName: webAppName
    location: location
  }
}

// module sqlModule 'sql-server.bicep' = if (location == 'ukwest') {
//   name: 'SQLDeploy'
//   params: {
//     location: location
//     administratorLogin: 'SQLAdmin123'
//   }
// }
