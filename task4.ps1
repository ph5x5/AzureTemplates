# Andrey Murzich
# Task 4
# VM deployment script

# Global configuration
$envLocation = "West Europe"
$TemplateFile = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/index.json"
$envPrefix = "learning4"
$storageTemplateLink = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/storage.json"
$vnetTemplateLink = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/vnet.json"
$vmTemplateLink = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/vm.json"
$iisTemplateLink = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/dsc.json"

# Storage Configuration
$storageSku = "STANDARD_LRS"
$storageKind = "StorageV2"
$storageAccessTier = "Cool"
$storageSupportHttpsTrafficOnly = "false"

# VNet Configuration
$addressPrefix = "10.13.0.0/16"
$dnsServer = "8.8.8.8"
$subnetName = "Subnet"
$subnetPrefix = "10.13.0.0/24"

# Public IP configuration
$publicIPAllocationMethod = "Dynamic"

# Interface configuration
$privateIPAllocationMethod = "Dynamic"

# VM Configuration
$vmSize = "Standard_A3"
$vmAdminUserName = "andrey_murzich"
$vmAdminPassword = "rUBDKjD4UW"
$vmOSPublisher = "MicrosoftWindowsServer"
$vmOSOffer = "WindowsServer"
$vmOSSku = "2016-Datacenter"
$vmOSVersion = "latest"
$vmDiskCaching = "ReadWrite"
$vmCreateOption = "FromImage"

# DSC Configuration
$_artifactsLocation = "https://csbf904e53bc8b7x4111x93b.file.core.windows.net"
$_artifactsLocationSasToken = "?sv=2017-04-17&ss=f&srt=sco&sp=r&se=2018-02-17T22:26:09Z&st=2018-01-21T14:26:09Z&spr=https,http&sig=ffY3b9%2BUV9h7gxyKDU8v%2B9o43WZXMU2wWwEREn8DMjU%3D"
$dscExtensionArchiveFolder = "cs-andrey-murzich-epam-com-1003bffda4a875ae"

$dscExtensionScriptName = "iis.ps1"
$dscExtensionArchiveFileName = "$dscExtensionScriptName.zip"
$dscExtensionFunction = "InstallIIS"
$dscIISBindPort = "8080"

# Account Login
#Login-AzureRmAccount

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
                                   -publicIPAllocationMethod $publicIPAllocationMethod `
                                   -privateIPAllocationMethod $privateIPAllocationMethod `
                                   -vmSize $vmSize `
                                   -vmAdminUserName $vmAdminUserName `
                                   -vmAdminPassword $vmAdminPassword `
                                   -vmOSPublisher $vmOSPublisher `
                                   -vmOSOffer $vmOSOffer `
                                   -vmOSSku $vmOSSku `
                                   -vmOSVersion $vmOSVersion `
                                   -vmDiskCaching $vmDiskCaching `
                                   -vmCreateOption $vmCreateOption `
                                   -_artifactsLocation $_artifactsLocation `
                                   -_artifactsLocationSasToken $_artifactsLocationSasToken `
                                   -dscExtensionArchiveFolder $dscExtensionArchiveFolder `
                                   -dscExtensionArchiveFileName $dscExtensionArchiveFileName `
                                   -dscExtensionScriptName $dscExtensionScriptName `
                                   -dscExtensionFunction $dscExtensionFunction `
                                   -dscIISBindPort $dscIISBindPort `
                                   -storageTemplateLink $storageTemplateLink `
                                   -vnetTemplateLink $vnetTemplateLink `
                                   -vmTemplateLink $vmTemplateLink `
                                   -iisTemplateLink $iisTemplateLink `
                                   -Force -Verbose