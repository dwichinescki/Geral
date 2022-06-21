using PrbSDConvenios.Back.Domain.Entities;
using PrbSDConvenios.Back.Service.Exemplo;
using PrbSDConvenios.Back.UnitTest.Fixtures;
using Xunit;

namespace PrbSDConvenios.Back.UnitTest.Services
{
    [Collection(nameof(ExemploSimulacaoServiceCollection))]
    public class ExemploSimulacaoServiceTests
    {
        private readonly ExemploSimulacaoServiceFixture _exemploSimulacaoServiceFixture;

        public ExemploSimulacaoServiceTests(ExemploSimulacaoServiceFixture exemploSimulacaoServiceFixture)
        {
            _exemploSimulacaoServiceFixture = exemploSimulacaoServiceFixture;
        }

        private ExemploSimulacaoService CreateService()
        {
            return new ExemploSimulacaoService();
        }

        [Fact(DisplayName = "Simulacao de Contrato Novo")]
        [Trait("Categoria", "Exemplo de Simulacao Service Testes")]
        public void SimulacaoContratoNovo_EstadoSobTeste_ComportamentoEsperado()
        {
            // Arrange
            var service = this.CreateService();
            ExemploSimulacao simulacao = _exemploSimulacaoServiceFixture.ObterExemploSimulacaoValida();

            // Act
            var result = service.SimulacaoContratoNovo(
                simulacao);

            // Assert
            Assert.Equal(simulacao.ValorParcela * 72, result.ValorLiberado);
        }
    }
}
