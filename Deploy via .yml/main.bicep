param location string
param webAppName string = 'JacobJardineTestSite001'

module webAppModule 'webapp-windows.bicep' = if (location == 'uksouth') {
  name: 'WebAppDeploy'
  params: {
    webAppName: webAppName
    location: location
  }
}


resource windowsVM 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: 'name'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_A2_v2'
    }
    osProfile: {
      computerName: 'computerName'
      adminUsername: 'adminUsername'
      adminPassword: 'adminPassword'
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2012-R2-Datacenter'
        version: 'latest'
      }
      osDisk: {
        name: 'name'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: 'id'
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri:  'storageUri'
      }
    }
  }
}





// module sqlModule 'sql-server.bicep' = if (location == 'ukwest') {
//   name: 'SQLDeploy'
//   params: {
//     location: location
//     administratorLogin: 'SQLAdmin123'
//   }
// }

//

