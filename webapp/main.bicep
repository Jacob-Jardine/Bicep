param webAppName string // Generate unique String for web app name
param sku string // The SKU of App Service Plan
param netFramework string // The runtime stack of web app
param location string // Location for all resources
param repositoryUrl string // Repository URL
param branch string // Default Branch
var appServicePlanName = toLower('AppServicePlan-${webAppName}')
var webSiteName = toLower('wapp-${webAppName}')

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: false
  }
  sku: {
    name: sku
  }
  kind: 'windows'
}
resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      netFrameworkVersion: netFramework
      appSettings: [
        {
          name: 'Testing1'
          value: 'Update'
        }
        {
          name: 'Testing2'
          value: 'Testing2'
        }
        {
          name: 'Testing3'
          value: 'sd'
        }
      ]
    }
  }
}
resource srcControls 'Microsoft.Web/sites/sourcecontrols@2021-01-01' = {
  name: '${appService.name}/web'
  properties: {
    repoUrl: repositoryUrl
    branch: branch
    isManualIntegration: true
  }
}
