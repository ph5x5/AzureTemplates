# Andrey Murzich
# Task 6
# Azure Web Applications deployment

# Template configuration
$templateFile = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task6/index.json"
$templateParameterUri1 = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task6/we/parameters.json"
$templateParameterUri2 = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task6/ne/parameters.json"
$envPrefix1 = "learning6-we"
$envPrefix2 = "learning6-ne"
$envLocation1 = "West Europe"
$envLocation2 = "North Europe"

# Account Login
#Login-AzureRmAccount

# Resource Group Deployment
# WebSite1
New-AzureRmResourceGroup -Name $envPrefix1 -Location $envLocation1 -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName $envPrefix1 `
                                   -TemplateFile $templateFile `
                                   -TemplateParameterUri $templateParameterUri1 `
                                   -Force -Verbose
# WebSite2
New-AzureRmResourceGroup -Name $envPrefix2 -Location $envLocation2 -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName $envPrefix2 `
                                   -TemplateFile $templateFile `
                                   -TemplateParameterUri $templateParameterUri2 `
                                   -Force -Verbose