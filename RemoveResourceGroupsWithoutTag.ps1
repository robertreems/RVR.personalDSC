# Get all the resource groups
$colResGroup = Get-AzureRmResourceGroup

# remove the resource groups
$colResGroup | Where-Object {$_.Tags -eq $null} | Remove-AzureRmResourceGroup -Force 
