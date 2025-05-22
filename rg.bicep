targetScope = 'subscription'

param name string = 'abd-rg'
param location string = 'eastus'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: name
  location: location
}

