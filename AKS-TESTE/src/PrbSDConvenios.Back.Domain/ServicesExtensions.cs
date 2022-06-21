using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using PrbSDConvenios.Back.Service.Exemplo;

namespace PrbSDConvenios.Back.Domain
{
    public static class ServicesExtensions
    {
        public static IServiceCollection AddDomainServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.RegisterServices();

            return services;
        }

        private static void RegisterServices(this IServiceCollection services)
        {
            services.Scan(_ => _
           .FromAssemblies(
               typeof(ExemploSimulacaoService).Assembly
           )
           .AddClasses()
           .AsImplementedInterfaces());
        }
    }
}
