# Andrey Murzich
# Task 7 - Restoration
# Restoration of backup created by arm template

# Restoration configuration
$envPrefix = "learning4"
$envLocation = "West Europe"
$startDate = (Get-Date).AddDays(-7)
$endDate = Get-Date
$resourceGroupStorage = "cloud-shell-storage-westeurope"
$storageAccountName = "csbf904e53bc8b7x4111x93b"
$jsonFileName = ".\storage.json"

# Account Login
#Login-AzureRmAccount

$vault = Get-AzureRmRecoveryServicesVault -Name "$envPrefix-vault"
Set-AzureRmRecoveryServicesVaultContext -Vault $vault
$container = Get-AzureRmRecoveryServicesBackupContainer -ContainerType AzureVM -Status Registered -FriendlyName "$envPrefix-vm"
$backupItem = Get-AzureRmRecoveryServicesBackupItem -WorkloadType AzureVM -Container $container
$RP = Get-AzureRmRecoveryServicesBackupRecoveryPoint -Item $backupItem -StartDate $startDate.ToUniversalTime() -EndDate $endDate.ToUniversalTime()
$restoreJob = Restore-AzureRmRecoveryServicesBackupItem -RecoveryPoint $RP[0] -StorageAccountName $storageAccountName -StorageAccountResourceGroupName $resourceGroupStorage

while ( $restoreJob.Status -ne "Completed" )
{
    Sleep 1
}

$webRequest = Invoke-WebRequest -Uri "https://csbf904e53bc8b7x4111x93b.blob.core.windows.net/vhde713ee7ff69447aa9c2708d74434c1a7/config8260339d-e042-4105-a1c0-857a9cec3923.json?sv=2017-04-17&ss=b&srt=sco&sp=r&se=2018-02-10T23:03:50Z&st=2018-02-08T15:03:50Z&spr=https,http&sig=xYcm%2F%2B8K4B7ZVgGv1c8%2F%2B4UvPBakpWwtKBieZoVyJlo%3D" -OutFile $jsonFileName

# Repairing file
$content = Get-Content $jsonFileName -Encoding Byte
$newContent = @()
$content | % {
    if ($_ -ne 0) {
        $newContent += $_
    }
}
$newContent | Set-Content $jsonFileName -Encoding Byte

# Processing JSON
$content = (Get-Content $jsonFileName) -join "`n"
$json = ConvertFrom-Json -InputObject $content

"Disk name: " + $json.'properties.storageProfile'.osDisk.name