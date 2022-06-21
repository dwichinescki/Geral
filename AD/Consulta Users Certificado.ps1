# Script para consulta de usuários com scripts já emitidos na CA

# Luiz Fernando - 26/05/2022

# Declara array e preenche com os usuários dos grupos de VPN
$users = @()

foreach ($user in (Get-ADGroupMember "Fortinet_SSLVPN_ADM_infra")) {
    $users += $user
}
 
foreach ($user in (Get-ADGroupMember "Fortinet_SSLVPN_Diretoria")) {
    $users += $user
}

foreach ($user in (Get-ADGroupMember "Fortinet_SSLVPN_Distrito")) {
    $users += $user
}

foreach ($user in (Get-ADGroupMember "Fortinet_SSLVPN_Contingencia")) {
    $users += $user
}

foreach ($user in (Get-ADGroupMember "Fortinet_SSLVPN_Pilotos")) {
    $users += $user
}

foreach ($user in (Get-ADGroupMember "Fortinet_SSLVPN_Suporte")) {
    $users += $user
}



# Carrega lista exportada da CA para comparação
if ($null -eq $certificados) {

    Write-Host -ForegroundColor Yellow "Informe o caminho completo do arquivo CSV: " -NoNewline
    $arquivo = Read-Host
    $certificados =  Import-Csv $arquivo
}


$template = "VPNUser (1.3.6.1.4.1.311.21.8.6291771.2154002.4017321.5755195.145578.177.12809392.3546003)"

# Gera array com os certificados emitidos para o template da VPN
$certificados = $certificados | Where-Object {$_."Certificate Template" -eq $template}

# Preenche os dois arrays com a mesma estrutura para possibilitar comparação
$certificados = $certificados."Requester Name" -replace 'PARANABANCO\\', ''
$users = $users.SamAccountName

foreach ($user in $users) {
    if ($certificados -notcontains $user) {
        Write-Host $user
    }
}
