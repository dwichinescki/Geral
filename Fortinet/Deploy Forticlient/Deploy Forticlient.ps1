# Luiz Fernando - 05/04/2022 - Início de desenvolvimento do script

# Script para deploy de configurações do Forticlient

# Cria a pasta utilizada para debug e logs
# New-Item -ItemType Directory -Path $env:USERPROFILE\FortiClient

<#Teste para execução elevada

# Parâmetros
$path = "C:\Users\luizfmm\OneDrive - PARANÁ BANCO S.A\TI\SVN\CoE Cloud\Scripts\Fortinet\Deploy Forticlient"
$scriptPath = 'C:\Users\luizfmm\OneDrive - PARANÁ BANCO S.A\TI\SVN\CoE Cloud\Scripts\Fortinet\Deploy Forticlient\ImportaConfig.ps1'
$admUser = "paranabanco\op.sd.aii"

# Capture encrypted password once and store to file
$passwd = Read-Host "Enter password" -AsSecureString
$encpwd = ConvertFrom-SecureString $passwd
$encpwd > $path\password.bin

# Afterwards always use this to start the script
$encpwd = Get-Content $path\password.bin
$passwd = ConvertTo-SecureString $encpwd
$cred = new-object System.Management.Automation.PSCredential $admUser, $passwd
Start-Process PowerShell -Cred $cred -ArgumentList '-noexit','-File', $scriptPath 


Start-Process Powershell -Credential $cred -ArgumentList '-ExecutionPolicy Bypass', '-NoProfile', '-File', 'C:\users\luizfmm\ImportaConfig.ps1'
PowerShell -executionpolicy bypass -noprofile -File $scriptPath
#>



# Checa se possui certificado emitido para o usuário. Se não, ou não for mais válido, solicita

# Preenche variável com o nome do usuário, com base no login de rede
$name = (Get-ADUser $env:USERNAME -Server 10.102.1.2).Name

# Checa se existe certificado com o nome do usuário, com validade de 90 dias ou mais
$certs = Get-ChildItem -path cert:\CurrentUser\My -Recurse | Where-Object {($_.Subject -eq "CN=" + $name) -and ($_.NotAfter -ge (Get-Date).AddDays(90))}

# Se não possui certificado dentro das especificações, solicita
if ($certs -eq $null) {
    Get-Certificate -Template VPNUser -CertStoreLocation cert:\CurrentUser\My
}


