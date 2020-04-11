# variables
$ResourceGroupName = 'RVR.PersonalDSC'
$TemplatePath = Get-Location | Join-Path -ChildPath 'ARMTemplates'

# Create new resource group
New-AzResourceGroup -Name $ResourceGroupName -Tag @{project='RVR.PersonalDSC'} -Location 'westeurope'

# Deploy Automation account
New-AzResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile $(Join-Path -Path $TemplatePath -ChildPath 'AutomationAccount.json')

dit is een test tegen de master