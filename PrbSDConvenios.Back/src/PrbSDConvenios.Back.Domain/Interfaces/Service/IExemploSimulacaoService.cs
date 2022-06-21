using PrbSDConvenios.Back.Domain.Entities;

namespace PrbSDConvenios.Back.Domain.Interfaces.Service
{
    public interface IExemploSimulacaoService
    {
        Domain.Entities.ExemploSimulacao SimulacaoContratoNovo(ExemploSimulacao simulacao);
    }
}
