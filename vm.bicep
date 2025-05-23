targetScope = 'resourceGroup'

param vmName string = 'abdvm'
param location string = resourceGroup().location
param vmSize string = 'Standard_D2s_v3'
param vmUserName string = 'azureuser'
@secure()
param vmUserPassword string
param vmOsDiskSizeGB int = 30
param vmOsDiskType string = 'StandardSSD_LRS'
param vmNicId string

resource vm 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: vmName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
      adminUsername: vmUserName
      adminPassword: vmUserPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '19_10-daily-gen2'
        version: 'latest'
      }
      osDisk: {
        name: '${vmName}-osdisk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
        diskSizeGB: vmOsDiskSizeGB
        managedDisk: {
          storageAccountType: vmOsDiskType
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: vmNicId
          properties: {
            primary: true
          }
        }
      ]
    }
  }
}

#command to run 
#az deployment group create --resource-group abd-rg --template-file vm.bicep --parameters vmUserPassword='P@ssw0rd1234' vmNicId='/subscriptions/adc9f320-e56e-45b1-845e-c73484745fc8/resourceGroups/abd-rg/providers/Microsoft.Network/networkInterfaces/abdnic' --debug
