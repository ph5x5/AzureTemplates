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

# Account Login
Login-AzureRmAccount

# Resource Group Deployment
New-AzureRmResourceGroup -Name $envPrefix -Location $envLocation -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName $envPrefix `
                                   -TemplateFile $templateFile `
                                   -TemplateParameterFile $templateParameterFile `
                                   -envPrefix $envPrefix `
                                   -envLocation $envLocation `
                                   -credentialsTemplateLink $credTemplateLink `
                                   -runbookTemplateLink $runbookTemplateLink `
                                   -jobTemplateLink $jobTemplateLink `
                                   -Force -Verbose