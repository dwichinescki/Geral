using System.Collections.Generic;
using System.Net;
using Microsoft.AspNetCore.Mvc;
using PrbSDConvenios.Back.Model.ViewModel;
using PrbSDConvenios.Back.Model.ViewModel.Exemplo;
using PrbSDConvenios.Back.Domain.Exceptions;
using PrbSDConvenios.Back.Application.Interfaces;

namespace PrbSDConvenios.Back.WebApi.Controllers
{
    [Route("exemplos")]
    public class ExemploController : ControllerBase
    {
        private readonly IExemploSimulacaoApp _exemploApp;
        public ExemploController(IExemploSimulacaoApp exemploApp)
        {
            _exemploApp = exemploApp;
        }

        /// <summary>
        ///     ConsultarHisconsDeCliente
        /// </summary>
        /// <remarks>
        ///     Consulta hiscons do cliente conforme o cpf
        /// </remarks>
        /// <param name="cpf">Cpf do Cliente</param>
        /// <returns>
        ///     Lista de hiscons do cliente
        /// </returns>
        [HttpGet]
        [Route("clientes/{Cpf}/hiscons")]
        [ProducesResponseType(typeof(ConsultarHisconsDeClienteViewModel.Response), (int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(List<ErroViewModel>), (int)HttpStatusCode.BadRequest)]
        public IActionResult ConsultarHisconsDeCliente(ConsultarHisconsDeClienteViewModel.Request request)
        {
            throw new ValidationException("Error1", "Mensagem");
            return Ok();
        }

        /// <summary>
        ///     SimularContratoNovo
        /// </summary>
        /// <remarks>
        ///     Simuação de contrato novo para Consignado
        /// </remarks>
        /// <returns>
        ///     Resultado da simulação de contrato novo
        /// </returns>
        [HttpPost]
        [Route("simulacao-contrato-novo")]
        [ProducesResponseType(typeof(SimularContratoNovoViewModel.Response), (int)HttpStatusCode.OK)]
        [ProducesResponseType(typeof(List<ErroViewModel>), (int)HttpStatusCode.BadRequest)]
        public IActionResult SimularContratoNovo([FromBody] SimularContratoNovoViewModel.Request request)
        {
            var response = _exemploApp.SimulacaoContratoNovo(request);
            return Ok(response);
        }
    }
}
