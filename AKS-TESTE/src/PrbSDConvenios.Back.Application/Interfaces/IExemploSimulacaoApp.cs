using PrbSDConvenios.Back.Model.ViewModel.Exemplo;

namespace PrbSDConvenios.Back.Application.Interfaces
{
    public interface IExemploSimulacaoApp
    {
        SimularContratoNovoViewModel.Response SimulacaoContratoNovo(SimularContratoNovoViewModel.Request request);
    }
}
