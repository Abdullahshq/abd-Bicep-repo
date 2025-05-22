targetScope = 'resourceGroup'

param vnetName string = 'abdvnet'
param location string = resourceGroup().location
param addressPrefix string = '10.0.0.0/16'
param subnetName string = 'abdsubnet'
param subnetPrefix string = '10.0.0.0/24'

resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}
