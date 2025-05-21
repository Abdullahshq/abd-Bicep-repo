targetScope = 'subscription'

@description('Name of the resource group')
param name string = 'abd-rg'

@description('Location for the resource group')
param location string = 'eastus'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: name
  location: location
}

output resourceGroupId string = rg.id
