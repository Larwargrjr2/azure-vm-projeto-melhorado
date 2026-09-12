@echo off
REM Azure CLI - exemplo didatico
REM Antes de executar: az login

set RG=rg-az900-vm-lab
set LOCATION=eastus

echo Criando Resource Group: %RG%
az group create --name %RG% --location %LOCATION%

pause
