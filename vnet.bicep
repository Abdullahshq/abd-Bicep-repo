targetScope = 'resourceGroup'

@description('Name of the Virtual Network')
param vnetName string = 'abdvnet'

@description('Location of the Virtual Network')
param location string = resourceGroup().location

@description('Address space for the Virtual Network')
param addressPrefix string = '10.0.0.0/16'

@description('Name of the subnet')
param subnetName string = 'abdsubnet'

@description('Address prefix for the subnet')
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

output vnetId string = vnet.id
output subnetId string = vnet.properties.subnets[0].id
