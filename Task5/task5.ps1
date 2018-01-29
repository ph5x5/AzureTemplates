# Andrey Murzich
# Task 5
# Runbook deployment script

# Template configuration
$templateFile = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task5/index.json"
$templateParameterFile = "https://raw.githubusercontent.com/ph5x5/AzureTemplates/master/Task5/parameters.json"

# Account Login
#Login-AzureRmAccount

# Resource Group Deployment
New-AzureRmResourceGroup -Name $envPrefix -Location $envLocation -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName $envPrefix `
                                   -TemplateFile $templateFile `
                                   -TemplateParameterUri $templateParameterFile `
                                   -Force -Verbose