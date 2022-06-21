using PrbSDConvenios.Back.Domain.Entities;
using System;
using Xunit;

namespace PrbSDConvenios.Back.UnitTest.Fixtures
{
    [CollectionDefinition(nameof(ExemploSimulacaoServiceCollection))]
    public class ExemploSimulacaoServiceCollection : ICollectionFixture<ExemploSimulacaoServiceFixture>
    { }
    public class ExemploSimulacaoServiceFixture : IDisposable
    {

        public ExemploSimulacao ObterExemploSimulacaoValida()
        {
            return new ExemploSimulacao() {
                ValorParcela = 100d,
                Cpf = "06426508969",
                ValorLiberado = 10.000d
            };
        }

        public void Dispose()
        {
         
        }
    }
}
