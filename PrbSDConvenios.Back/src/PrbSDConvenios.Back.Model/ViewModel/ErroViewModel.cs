using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace PrbSDConvenios.Back.Model.ViewModel
{
    public class ErroViewModel
    {
        /// <summary>
        /// Código de erro para facilitar busca do mesmo
        /// </summary>
        public string Codigo { get; set; }

        /// <summary>
        /// Mensagem de erro com detalhes
        /// </summary>
        public string Mensagem { get; set; }

        public ErroViewModel() { }
        public ErroViewModel(string mensagem)
        {
            if (mensagem.Contains("|"))
            {
                var split = mensagem.Split('|');
                this.Codigo = split.FirstOrDefault();
                this.Mensagem = split.LastOrDefault();
            }
            else { this.Mensagem = mensagem; }
        }
        public ErroViewModel(string mensagem, string codigo)
        {
            this.Mensagem = mensagem;
            this.Codigo = codigo;
        }
    }
}
