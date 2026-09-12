@echo off
REM Azure CLI - exemplo didatico para VM Linux
REM Pre-requisitos: az login e Resource Group criado.
REM Ajuste LOCATION, IMAGE e SIZE conforme sua assinatura/regiao.

set RG=rg-az900-vm-lab
set LOCATION=eastus
set VM=vm-az900-lab
set IMAGE=Ubuntu2204
set SIZE=Standard_B1s

echo Criando VM %VM%...
az vm create ^
  --resource-group %RG% ^
  --name %VM% ^
  --location %LOCATION% ^
  --image %IMAGE% ^
  --size %SIZE% ^
  --admin-username azureuser ^
  --generate-ssh-keys

echo.
echo VM criada ou processada. Verifique a saida acima.
pause
