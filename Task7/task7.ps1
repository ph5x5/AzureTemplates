# Andrey Murzich
# Task 7
# Azure Recovery Vault Manipulation (Uses VM created in Task4)

# Templates configuration
$templateFile = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task7/index.json"
$templateParameterUri = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task7/parameters.json"
$envPrefix = "learning4"
$envLocation = "West Europe"

# Account Login
#Login-AzureRmAccount

# Resource Group Deployment
New-AzureRmResourceGroup -Name $envPrefix -Location $envLocation -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName $envPrefix `
                                   -TemplateFile $templateFile `
                                   -TemplateParameterUri $templateParameterUri `
                                   -Force -Verbose