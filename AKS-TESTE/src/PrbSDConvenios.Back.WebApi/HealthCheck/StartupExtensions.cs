using HealthChecks.UI.Client;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Diagnostics.HealthChecks;

namespace PrbSDConvenios.Back.WebApi.HealthCheck
{
    public static class StartupExtensions
    {
        public static void UseHealthCheck(this IApplicationBuilder app)
        {
            HealthCheckOptions options = new HealthCheckOptions();
            options.ResultStatusCodes[HealthStatus.Degraded] = 200;
            options.Predicate = _ => true;
            options.ResponseWriter = UIResponseWriter.WriteHealthCheckUIResponse;
            app.UseHealthChecks("/health", options);
        }

        public static IServiceCollection AddAllHealthChecks(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddHealthChecks();
            //Web API Internas
            //services.AddHealthChecks()
            //    .AddUrlGroup(name: "WebApi | PrbClienteConsignado",
            //                failureStatus: HealthStatus.Degraded,
            //                uri: new Uri($"{configuration["PrbClienteConsignadoSettings:ApiUrl"]}infra"));

            return services;
        }
    }
}
