# Andrey Murzich
# Task 6
# Azure Web Applications deployment

# Template configuration
$templateFile = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task6/index.json"
$templateParameterUri = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task6/parameters.json"
$envPrefix1 = "learning6-we"
$envPrefix2 = "learning6-ne"
$envLocation1 = "West Europe"
$envLocation2 = "North Europe"

# Account Login
Login-AzureRmAccount

# Resource Group Deployment
New-AzureRmResourceGroup -Name $envPrefix1 -Location $envLocation1 -Force
New-AzureRmResourceGroup -Name $envPrefix2 -Location $envLocation2 -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName $envPrefix `
                                   -TemplateFile $templateFile `
                                   -TemplateParameterUri $templateParameterUri `
                                   -Force -Verbose