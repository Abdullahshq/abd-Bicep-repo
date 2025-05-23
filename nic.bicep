targetScope = 'resourceGroup'

param nicName string = 'abdnic'
param location string = resourceGroup().location

resource nic 'Microsoft.Network/networkInterfaces@2023-05-01' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: '/subscriptions/adc9f320-e56e-45b1-845e-c73484745fc8/resourceGroups/abd-rg/providers/Microsoft.Network/publicIPAddresses/abdpublicip'
          }
          subnet: {
            id: '/subscriptions/adc9f320-e56e-45b1-845e-c73484745fc8/resourceGroups/abd-rg/providers/Microsoft.Network/virtualNetworks/abdvnet/subnets/abdsubnet'
          }
        }
      }
    ]
  }
}
