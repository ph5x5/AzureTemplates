# Andrey Murzich
# Task 8
# Web Application + SQL Database

# Templates configuration
$templateFile = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task8/index.json"
$templateParameterUri = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task8/parameters.json"
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

