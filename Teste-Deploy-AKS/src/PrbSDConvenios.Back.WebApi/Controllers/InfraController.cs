using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PrbSDConvenios.Back.WebApi.Controllers
{
    [Route("api/infra")]
    public class InfraController : ControllerBase
    {
        public InfraController()
        {
        }

        /// <summary>
        ///     Infra/OK
        /// </summary>
        /// <remarks>
        ///     Verifica se o container e aplicação está rodando
        /// </remarks>
        /// <returns>
        ///     Status do container
        /// </returns>
        /// <response code="200">Aplicação no ar</response>
        [HttpGet]
        public IActionResult Get()
        {
            return Ok();
        }
    }
}
