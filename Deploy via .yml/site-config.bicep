param appSettings object
param currentAppSettings object
param webAppName string

resource siteconfig 'Microsoft.Web/sites/config@2022-03-01' = {
  name: '${webAppName}/appsettings'
  properties: union(currentAppSettings, appSettings)
}
