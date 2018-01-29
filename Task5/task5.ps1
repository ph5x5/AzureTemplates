# Andrey Murzich
# Task 5
# Runbook deployment script

# Template configuration
$templateFile = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task5/index.json"
$templateParameterUri = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task5/parameters.json"
$envPrefix = "learning4"
$envLocation = "West Europe"

# Account Login
Login-AzureRmAccount

# Resource Group Deployment
New-AzureRmResourceGroup -Name $envPrefix -Location $envLocation -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName $envPrefix `
                                   -TemplateFile $templateFile `
                                   -TemplateParameterUri $templateParameterUri `
                                   -Force -Verbose