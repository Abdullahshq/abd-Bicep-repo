
param nsgName string = 'myNsg'
param location string = resourceGroup().location

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: []
  }
}
