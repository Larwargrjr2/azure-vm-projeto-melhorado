@echo off
set RG=rg-az900-vm-lab

echo ATENCAO: este comando exclui o Resource Group e os recursos dentro dele.
choice /M "Deseja continuar"
if errorlevel 2 exit /b 1

az group delete --name %RG% --yes --no-wait

echo Comando de exclusao enviado.
pause
