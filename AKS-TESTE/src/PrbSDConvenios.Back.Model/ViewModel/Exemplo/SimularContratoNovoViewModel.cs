using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace PrbSDConvenios.Back.Model.ViewModel.Exemplo
{
    public class SimularContratoNovoViewModel
    {
        public class Request
        {
            /// <summary>
            /// Cpf do cliente
            /// </summary>
            public string Cpf { get; set; }

            /// <summary>
            /// Valor da parcela para simulação
            /// </summary>
            public double ValorParcela { get; set; }
        }
        public class Response
        {
            /// <summary>
            /// Valor liberado para credito ao cliente
            /// </summary>
            public double ValorLiberado { get; set; }
        }
    }
}
