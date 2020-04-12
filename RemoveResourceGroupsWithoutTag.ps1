# Copied from https://docs.microsoft.com/nl-nl/azure/automation/automation-first-runbook-textual-powershell
# Ensures you do not inherit an AzContext in your runbook
Disable-AzContextAutosave –Scope Process

$connection = Get-AutomationConnection -Name AzureRunAsConnection

while(!($connectionResult) -And ($logonAttempt -le 10))
{
    $LogonAttempt++
    # Logging in to Azure...
    $connectionResult =    Connect-AzAccount `
                               -ServicePrincipal `
                               -Tenant $connection.TenantID `
                               -ApplicationId $connection.ApplicationID `
                               -CertificateThumbprint $connection.CertificateThumbprint

    Start-Sleep -Seconds 30
}

## Now find and remove the resource groups
# Get all the resource groups
$colResGroup = Get-AZResourceGroup

# remove the resource groups
$colResGroup 
# todo