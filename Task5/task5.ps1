# Andrey Murzich
# Task 5
# Runbook deployment script

# Global configuration
$envLocation = "West Europe"
$templateFile = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task5/index.json"
$templateParameterFile = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task5/parameters.json"
$envPrefix = "learning4"
$credTemplateLink = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task5/cred.json"
$runbookTemplateLink = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task5/runbook.json"
$jobTemplateLink = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task5/job.json"

$storagePath = "https://csbf904e53bc8b7x4111x93b.file.core.windows.net/cs-andrey-murzich-epam-com-1003bffda4a875ae/Task5"
$sasToken = "?sv=2017-04-17&ss=f&srt=sco&sp=r&se=2018-02-17T22:26:09Z&st=2018-01-21T14:26:09Z&spr=https,http&sig=ffY3b9%2BUV9h7gxyKDU8v%2B9o43WZXMU2wWwEREn8DMjU%3D"

# Account Login
#Login-AzureRmAccount

# Resource Group Deployment
New-AzureRmResourceGroup -Name $envPrefix -Location $envLocation -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName $envPrefix `
                                   -TemplateFile $templateFile `
                                   -TemplateParameterFile $templateParameterFile `
                                   -envPrefix $envPrefix `
                                   -envLocation $envLocation `
                                   -storagePath $storagePath `
                                   -sasToken $sasToken `
                                   -credTemplateLink $credTemplateLink `
                                   -runbookTemplateLink $runbookTemplateLink `
                                   -jobTemplateLink $jobTemplateLink `
                                   -Force -Verbose