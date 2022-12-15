param deployApp bool
param location string
param yourname string

import storage_accounts from './modules/storage_accounts.bicep'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
    name: yourname + '-asp'
    location: location
    properties: {
        sku: {
            tier: 'B1'
        }
    }
}

if (deployApp) {
    resource webApp 'Microsoft.Web/sites@2020-06-01' = {
        name: yourname + '-app'
        location: location
        properties: {
            serverFarmId: appServicePlan.id
            siteConfig: {
                appSettings: [
                    {
                        name: 'MYSECRET'
                        value: '<your secret value>'
                    }
                ]
            }
        }
    }
}

storage_accounts(kind: 'StorageV2', accessTier: 'Hot', location: location, yourname: yourname)
