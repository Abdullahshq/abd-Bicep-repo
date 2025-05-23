targetScope = 'resourceGroup'

param publicIpName string = 'abdpublicip'
param location string = resourceGroup().location
param publicIpSku string = 'Standard'
param publicIpTier string = 'Regional'
param publicIpAllocationMethod string = 'Static'
param publicIpDnsName string = 'abdpublicipdns'

resource publicIp 'Microsoft.Network/publicIPAddresses@2023-05-01' = {
  name: publicIpName
  location: location
  sku: {
    name: publicIpSku
    tier: publicIpTier
  }
  properties: {
    publicIPAllocationMethod: publicIpAllocationMethod
    dnsSettings: {
      domainNameLabel: publicIpDnsName
      reverseFqdn: ''
    }
  }
}
