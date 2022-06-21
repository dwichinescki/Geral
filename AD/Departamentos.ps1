# Luiz Fernando - 10/09/2019


$SearchBase = "OU=Usuarios,DC=ParanaBanco,DC=jm"
$departamento = $null
$departamentos = @()

$usuarios = Get-Aduser -Properties Department -Filter * -SearchBase $SearchBase -Server TPRB0102 

foreach ($usuario in $usuarios) {
    if ($departamentos.Contains($usuario.Department)) {
    }
    else {
        $departamentos += $usuario.Department
    }  
}

$departamentos | Sort