using AutoMapper;
using PrbSDConvenios.Back.Application.Interfaces;
using PrbSDConvenios.Back.Domain.Entities;
using PrbSDConvenios.Back.Domain.Interfaces.Service;
using PrbSDConvenios.Back.Model.ViewModel.Exemplo;

namespace PrbSDConvenios.Back.Application.Exemplo
{
    public class ExemploSimulacaoApp : IExemploSimulacaoApp
    {
        private readonly IExemploSimulacaoService _exemploService;
        private readonly IMapper _mapper;
        public ExemploSimulacaoApp(
            IExemploSimulacaoService exemploService,
            IMapper mapper)
        {
            _exemploService = exemploService;
            _mapper = mapper;
        }

        public SimularContratoNovoViewModel.Response SimulacaoContratoNovo(SimularContratoNovoViewModel.Request request)
        {
            var simulacao = _mapper.Map<ExemploSimulacao>(request);
            var result = _exemploService.SimulacaoContratoNovo(simulacao);
            return _mapper.Map<SimularContratoNovoViewModel.Response>(result);
        }
    }
}
