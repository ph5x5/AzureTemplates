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

$container = Get-AzureRmRecoveryServicesBackupContainer -ContainerType AzureVM -Status Registered -FriendlyName "$envPrefix-vm"
$backupItem = Get-AzureRmRecoveryServicesBackupItem -WorkloadType AzureVM -Container $container
$RP = Get-AzureRmRecoveryServicesBackupRecoveryPoint -Item $backupItem -StartDate $startDate.ToUniversalTime() -EndDate $endDate.ToUniversalTime()
$RestoreJob = Restore-AzureRmRecoveryServicesBackupItem -RecoveryPoint $RP[0] -StorageAccountName $storageAccountName -StorageAccountResourceGroupName $resourceGroupStorage