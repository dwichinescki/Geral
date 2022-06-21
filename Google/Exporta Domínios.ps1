# Luiz Fernando - 2/9/19

$zonas = @(
    "bancodigital-b-br",
    "bancojmalucelli-b-br",
    "bancojmalucelli-com",
    "bancojmalucelli-com-br",
    "clienteparanabanco-com-br",
    "consignadoparanabanco-com-br",
    "consignadopremiado-com-br",
    "eadparanabanco-com-br",
    "emprestja-com-br",
    "franquiaparanabanco-com-br"
)

foreach ($zona in $zonas) {
    gcloud dns record-sets export ('C:\Users\luizfmm\Downloads\' + $zona.ToString())  -z $zona.ToString() --zone-file-format
}