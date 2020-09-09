#Instalar choco para administración de programas
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n=allowGlobalConfirmation
choco install git /GitOnlyOnPath
choco install nodejs
choco install miniconda3 --version=4.7.12.1
refreshenv
cmd.exe /c "automatization.bat"