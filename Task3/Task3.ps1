# Andrey Murzich
# Task 3
# Storage and Vnet deployment script

# Global Configuration
$envLocation = "West Europe"
$TemplateFile = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/index.json"
$envPrefix = "learning3"
$storageTemplateLink = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/storage.json"
$vnetTemplateLink = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/vnet.json"

# Storage Configuration
$storageSku = "STANDARD_LRS"
$storageKind = "BlobStorage"
$storageAccessTier = "Cool"
$storageSupportHttpsTrafficOnly = "false"

# VNet Configuration
$addressPrefix = "10.13.0.0/16"
$dnsServer = "8.8.8.8"
$subnetName = "Subnet"
$subnetPrefix = "10.13.0.0/24"

# Account Login
Login-AzureRmAccount

# Resource Group Deployment
New-AzureRmResourceGroup -Name $envPrefix -Location $envLocation
New-AzureRmResourceGroupDeployment -ResourceGroupName $envPrefix `
                                   -TemplateFile $TemplateFile `
                                   -envPrefix $envPrefix `
                                   -envLocation $envLocation `
                                   -storageSku $storageSku `
                                   -storageKind $storageKind `
                                   -storageAccessTier $storageAccessTier `
                                   -storageSupportHttpsTrafficOnly $storageSupportHttpsTrafficOnly `
                                   -addressPrefix $addressPrefix `
                                   -dnsServer $dnsServer `
                                   -subnetName $subnetName `
                                   -subnetPrefix $subnetPrefix `
                                   -storageTemplateLink $storageTemplateLink `
                                   -vnetTemplateLink $vnetTemplateLink `
                                   -Force -Verbose