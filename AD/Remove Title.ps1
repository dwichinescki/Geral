# Luiz Fernando - 18/6/2019

# Script para remover campo Title dos usuários


# Se recursivo

# Carrega a lista de OU's baseado na OU informada

# Informe a OU e o modo
Write-Host -ForegroundColor Yellow "Informe em qual OU deseja atuar: " -NoNewline
$OU = Read-Host

Write-Host -ForegroundColor Yellow "Deseja atuar de modo recursivo?(S/N) " -NoNewline
$Opcao = Read-Host

# Carrega os usuários da OU e remove o campo Title
# Se não for recursivo
if ($Opcao.ToUpper() -ne 'S') {
    $usuarios = Get-ADUser -Filter * -Properties * -SearchBase $OU -SearchScope OneLevel
}

# Se recursivo
else {
    $usuarios = Get-ADUser -Filter * -Properties * -SearchBase $OU -SearchScope Subtree
}


# Questiona se continua
Write-Host -ForegroundColor Yellow `n"O campo Title será removido nos seguintes usuários:"
$usuarios | Select Name, samAccountName, Title
Write-Host -ForegroundColor Yellow "Continuar? (S/N) " -NoNewline
$Continuar = Read-Host

if ($Continuar.ToUpper() -eq 'S') {
    # Remove o campo para cada usuário na lista $usuarios
    foreach ($usuario in $usuarios) {
        
        # Informa
        (Write-Host -ForegroundColor Yellow "Executando em " -NoNewline) + ($usuario.SamAccountName)
        
        # Remove  o campo para cada usuário da lista $usuarios
        Set-ADUser -Identity $usuario.samAccountName -Title $null
    }


}

else {
    Write-Host -ForegroundColor Yellow `n"Script abortado"
}