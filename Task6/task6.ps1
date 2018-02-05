# Andrey Murzich
# Task 6
# Azure Web Applications deployment

# Templates configuration
$templateFile = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task6/index.json"
$templateParameterUri = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task6/parameters.json"
$envPrefix = "learning6"
$envLocation = "West Europe"

# Account Login
#Login-AzureRmAccount

# Resource Group Deployment
New-AzureRmResourceGroup -Name $envPrefix -Location $envLocation -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName $envPrefix `
                                   -TemplateFile $templateFile `
                                   -TemplateParameterUri $templateParameterUri `
                                   -Force -Verbose

# Info
$tm = Get-AzureRmTrafficManagerProfile -ResourceGroupName $envPrefix
$tm
$tm.Endpoints