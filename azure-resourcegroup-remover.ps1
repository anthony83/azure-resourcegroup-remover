
function Show-Menu
{
    param (
        [string]$Title = 'Azure Resource Group Remover'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    Write-Host "1: List all current resource groups."
    Write-Host "2: Select a resource group to delete."
    Write-Host "3: Nuke all resource groups."
    Write-Host "Q: Press 'Q' to quit."
}
do
{
     Show-Menu –Title 'Azure Resource Group Remover'
     $selection = Read-Host "Please make a selection"
     switch ($selection)
     {
         '1' {
            'You chosen to list all current resource groups.'
            Get-AzResourceGroup | ft
         }'2' {
            'Please type the name of the resource group you would like to delete.'
            Get-AzResourceGroup | ft
            $resource = Read-Host 'Resource group name to delete.'
            Remove-AzResourceGroup -Name $resource
            'Remaining resource groups.'
            Get-AzResourceGroup | ft
         }'3' {
            Get-AzResourceGroup | Remove-AzResourceGroup -verbose -Force
            'Please type the name of the resource group you would like to delete.'
         }
     } 
     pause
}
until ($selection -eq 'q')


