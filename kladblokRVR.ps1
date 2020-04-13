# variables
$ResourceGroupName = 'RVR.PersonalDSC'
$TemplatePath = Get-Location | Join-Path -ChildPath 'ARMTemplates'

# Create new resource group
New-AzResourceGroup -Name $ResourceGroupName -Tag @{project='RVR.PersonalDSC'} -Location 'westeurope'

# Deploy Automation account
New-AzResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile $(Join-Path -Path $TemplatePath -ChildPath 'AutomationAccount.json')

# runbook stuff
new-AzResourceGroupDeployment `
    -ResourceGroupName 'RVR1' `
    -TemplateFile $(Join-Path -Path $TemplatePath -ChildPath 'runbook.json') `
    -automationAccountName 'MyAutomationAccount' `
    -scheduleStartDateTime "$(get-date -Format 'yyyy-MM-dd')T21:59:10.4846451Z"


[Xml.XmlConvert]::ToString((get-date -Hour 23 -Minute 59),[Xml.XmlDateTimeSerializationMode]::Utc)

"$(get-date -Format 'yyyy-MM-dd')T21:59:10.4846451Z"