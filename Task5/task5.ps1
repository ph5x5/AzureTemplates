# Andrey Murzich
# Task 5
# Runbook deployment script

# Template configuration
$templateFile = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task5/index.json"
$templateParameterUri = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task5/parameters.json"

# Account Login
#Login-AzureRmAccount

# Resource Group Deployment
New-AzureRmResourceGroup -Name "learning4" -Location "West Europe" -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName $envPrefix `
                                   -TemplateFile $templateFile `
                                   -TemplateParameterUri $templateParameterUri `
                                   -Force -Verbose