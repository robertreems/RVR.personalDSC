# Get all the resource groups
$colResGroup = Get-AzResourceGroup

# remove the resource groups
$colResGroup | Where-Object {$_.Tags -eq $null} | Remove-AzResourceGroup -Force 