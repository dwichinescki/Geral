using PrbSDConvenios.Back.Domain.Entities;
using PrbSDConvenios.Back.Domain.Interfaces.Service;

namespace PrbSDConvenios.Back.Service.Exemplo
{
    public class ExemploSimulacaoService : IExemploSimulacaoService
    {
        public ExemploSimulacao SimulacaoContratoNovo(ExemploSimulacao simulacao)
        {
            simulacao.ValorLiberado = simulacao.ValorParcela * 72;
            return simulacao;
        }
    }
}
