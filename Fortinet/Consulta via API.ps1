# Luiz Fernando 30/3/2021

# Script para consultar dados do Fortigate via API

# Use com cuidado!

# Documentação
# https://loadbalancing.se/2019/05/02/fortigate-api-fortios-6-2/
# https://kb.fortinet.com/kb/documentLink.do?externalID=FD45595
# https://kb.fortinet.com/kb/documentLink.do?externalID=FD33786

# Informando credenciais
Write-Host -ForegroundColor Yellow "Informe o endereço do firewall: " -NoNewline
$fwaddress = Read-Host 

Write-Host -ForegroundColor Yellow "Informe seu usuário: " -NoNewline
$user = Read-Host 

Write-Host -ForegroundColor Yellow "Informe sua senha: " -NoNewline
$password = Read-Host -AsSecureString
$plainpwd = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))


# Trata a URL base
$urlBase = "https://" + $fwaddress + ":10443"
#$urlBase = "http://" + $fwaddress


# Header de autenticação
$postParameters = @{
    "username" = $user
    "secretkey" = $plainpwd
}

# Chama autenticação
$token = Invoke-WebRequest -Method POST ($urlbase + "/logincheck") -Body $PostParameters -SessionVariable FortigateSession


# Caso precise do token
# $CSRFTOKEN = ($FortigateSession.Cookies.GetCookies($urlBase) | Where-Object { $_.name -eq "ccsrftoken" }).value.replace("`"", "")

########################################################################################################################################

# Uso da engine monitor da API
#
# Consulta políticas ativas e preenche no array monPolicies
$monPolicies = Invoke-WebRequest -Method GET ($urlbase + "/api/v2/monitor/firewall/policy") -WebSession $FortigateSession | ConvertFrom-Json
$monPolicies = $monPolicies.results

# Declaração de arrays
$oldPolicies = @()
$noHitPolicies = @()
$goodPolicies = @()
$allMonPolicies = @()


# Para cada item no array monPolicies, executa
$monPolicies | foreach {
    $lastUsed = (Get-Date "1970-01-01 00:00:00.000Z") + ([TimeSpan]::FromSeconds($_.last_used))

    # Se o campo last_used estiver vazio
    if ($_.last_used -eq $null){
        $noHitPolicies += $_
        $allMonPolicies += $_
    }

    # Se o campo last_used trouxer um valor que, convertido, informa mais de 90 dias a partir de agora
    elseif ((((Get-Date) - $lastUsed).Days -gt 90)) {
        $oldPolicies += $_
        $allMonPolicies += $_
    }

    # Se nenhuma das anteriores, é política em uso
    else {
        $goodPolicies += $_
        $allMonPolicies += $_
    }
}


# Uso da engine config da API
# Busca todas as políticas configuradas
$allPolicies = Invoke-WebRequest -Method GET ($urlbase + "/api/v2/cmdb/firewall/policy") -WebSession $FortigateSession | ConvertFrom-Json
$allPolicies = $allPolicies.results

# Busca políticas desabilitadas
$disPolicies = $allPolicies | Where-Object {$_.status -eq "disable"}

#Relatório
Write-Host -ForegroundColor Yellow "`nPolíticas em uso: " -NoNewline; Write-Host -ForegroundColor Green $goodPolicies.Count
Write-Host -ForegroundColor Yellow "Políticas desabilitadas: " -NoNewline; Write-Host -ForegroundColor Green $disPolicies.Count
Write-Host -ForegroundColor Yellow "Políticas sem hit count: " -NoNewline; Write-Host -ForegroundColor Green $noHitPolicies.Count
Write-Host -ForegroundColor Yellow "Políticas sem hit há mais de 90 dias: " -NoNewline; Write-Host -ForegroundColor Green $oldPolicies.Count
Write-Host -ForegroundColor Yellow "`nTotal de políticas ativas: " -NoNewline; Write-Host -ForegroundColor Green $monPolicies.Count
Write-Host -ForegroundColor Yellow "Total de políticas configuradas: " -NoNewline; Write-Host -ForegroundColor Green $allPolicies.Count "`n"

# Configurações das políticas antigas
$oldPoliciesConfig = @()
foreach ($policy in $oldPolicies) {
    $thisOldPolicy = $allPolicies | where {$_.policyid -eq $policy.policyid} 
    $oldPoliciesConfig += $thisOldPolicy
}

# Configurações das políticas sem hit count
$noHitPoliciesConfig = @()
foreach ($policy in $noHitPolicies) {
    $thisnoHitPolicy = $allPolicies | where {$_.policyid -eq $policy.policyid} 
    $noHitPoliciesConfig += $thisnoHitPolicy
}


########################################################################################################################################

# VIPs
# Busca todos os VIPs
$allVips = Invoke-WebRequest -Method GET ($urlbase + "/api/v2/cmdb/firewall/vip") -WebSession $FortigateSession | ConvertFrom-Json


########################################################################################################################################

# Busca configurações de log

$syslogd = Invoke-WebRequest -Method GET ($urlbase + "/api/v2/cmdb/log.syslogd/setting") -WebSession $FortigateSession | ConvertFrom-Json

# Hashtable com as lojas
$Lojas = @{

    Araucaria           = "10.41.197.1"
    BeloHorizonte       = "10.31.0.1"
    Boqueirao           = "10.41.230.1"
    Cascavel            = "10.45.1.1"
    CIC                 = "10.41.200.1"
    Campinas            = "10.19.0.1"
    CampoLargo          = "10.41.196.1"
    CampoMourao         = "10.44.3.1"
    FozdoIguacu         = "10.45.0.1"
    Florianopolis       = "10.48.0.1"
    Goiania             = "10.62.0.1"
    Guarulhos           = "10.11.2.1"
    Londrina1           = "10.43.0.1"
    Marechal            = "10.41.192.1"
    Maringa1            = "10.44.0.1"
    Salvador2           = "10.71.1.1"
    SaoJosedosCampos    = "10.12.0.1"
    SaoJosedosPinhais   = "10.41.198.1"
    Santos              = "10.13.0.1"
    MarquesdeItu        = "10.11.0.1"
    SantoAndre          = "10.11.4.1"
    Tito                = "10.11.6.1"

}

$IPs = $Lojas.Values

foreach ($ip in $IPs) {
    
    # urlBase
    $urlBase = "https://" + $ip + ":10443"

    # Autenticacao
    $token = Invoke-WebRequest -Method POST ($urlbase + "/logincheck") -Body $PostParameters -SessionVariable FortigateSession

    # Captura dados do syslog
    Write-Host -ForegroundColor Yellow $ip
    $syslogd = Invoke-WebRequest -Method GET ($urlbase + "/api/v2/cmdb/log.syslogd/setting") -WebSession $FortigateSession | ConvertFrom-Json
    $syslogd.results | Format-Table source-ip, server, port -HideTableHeaders
    
}


########################################################################################################################################

# Busca configurações de snmp

$snmp = Invoke-WebRequest -Method GET ($urlbase + "/api/v2/cmdb/system.snmp/community") -WebSession $FortigateSession | ConvertFrom-Json


########################################################################################################################################

# Rascunho


$tocsv = $allPolicies | Where-Object {$_.status -eq "disable"} | select policyid, status, @{N='srcintf';E={$_.srcintf.name}}, @{N='dstintf';E={$_.dstintf.name}}, @{N='srcaddr';E={$_.srcaddr.name}}, @{N='groups';E={$_.groups.name}}, @{N='dstaddr';E={$_.dstaddr.name}}, @{N='service';E={$_.service.name}}
$tocsv | Export-Csv .\Fortinet\Backend.csv


