using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.PlatformAbstractions;
using Microsoft.OpenApi.Models;
using System.IO;

namespace PrbSDConvenios.Back.WebApi.Swagger
{
    public static class StartupExtensions
    {
        public static void AddSwagger(this IServiceCollection services, string solutionName)
        {
            services.AddSwaggerGen(options =>
            {
                options.SwaggerDoc("v1", new OpenApiInfo { Title = solutionName, Version = "v1" });
                options.CustomSchemaIds(x => x.FullName);

                var caminhoAplicacao = PlatformServices.Default.Application.ApplicationBasePath;
                var nomeAplicacao = PlatformServices.Default.Application.ApplicationName;

                var caminhoXmlDocApi = Path.Combine(caminhoAplicacao, $"{nomeAplicacao}.xml");

                var caminhoXmlDocApiModel = Path.Combine(caminhoAplicacao, $"{solutionName}.Model.xml");

                if (File.Exists(caminhoXmlDocApi))
                {
                    options.IncludeXmlComments(caminhoXmlDocApi);
                }

                if (File.Exists(caminhoXmlDocApiModel))
                {
                    options.IncludeXmlComments(caminhoXmlDocApiModel);
                }
            });
        }

        public static void UseSwagger(this IApplicationBuilder app, string solutionName)
        {
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", solutionName);
            });            
        }        
    }
}
