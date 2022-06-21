using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using PrbSDConvenios.Back.Application;
using PrbSDConvenios.Back.Domain;
using PrbSDConvenios.Back.Mappings;
using PrbSDConvenios.Back.WebApi.Filters;
using PrbSDConvenios.Back.WebApi.HealthCheck;
using PrbSDConvenios.Back.WebApi.Middlewares;
using PrbSDConvenios.Back.WebApi.Swagger;
using System.Diagnostics.CodeAnalysis;

namespace PrbSDConvenios.Back.WebApi
{
    [ExcludeFromCodeCoverage]
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
            SolutionName = "PrbSDConvenios.Back";
        }


        public IConfiguration Configuration { get; }
        private string SolutionName { get; set; }

        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<KestrelServerOptions>(options =>
            {
                options.AllowSynchronousIO = true;
            });

            services.Configure<IISServerOptions>(options =>
            {
                options.AllowSynchronousIO = true;
            });

            services.AddSwagger(SolutionName);

            services.AddTransient<TelemetryMiddleware>();

            services.AddControllers();

            services.AddMvc(options =>
            {
                options.Filters.Add(typeof(ValidationFilter));
            });

            services.AddApplicationServices(Configuration)
                    .AddDomainServices(Configuration)
                    .AddAllHealthChecks(Configuration)
                    .AddMappings();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsEnvironment("Local"))
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger(SolutionName);

            app.UseRouting();

            app.UseAuthorization();

            app.UseMiddleware(typeof(ErrorHandlingMiddleware));
            app.UseMiddleware<TelemetryMiddleware>();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

            app.UseHealthCheck();
        }
    }
}
