@echo off
set RG=rg-az900-vm-lab
set VM=vm-az900-lab

echo === Estado ===
az vm get-instance-view --resource-group %RG% --name %VM% --query "instanceView.statuses[].displayStatus" -o tsv

echo.
echo === Visao geral ===
az vm show --resource-group %RG% --name %VM% --show-details -o table
pause
