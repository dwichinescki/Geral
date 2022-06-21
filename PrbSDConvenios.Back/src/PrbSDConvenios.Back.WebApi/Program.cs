using System;
using System.Diagnostics.CodeAnalysis;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Serilog;

namespace PrbSDConvenios.Back.WebApi
{
    [ExcludeFromCodeCoverage]
    public class Program
    {
        public static IConfiguration Configuration
        {
            get
            {
                var env = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT") ?? "Local";

                return new ConfigurationBuilder()                    
                    .AddJsonFile("sharedSettings.json", optional: true, reloadOnChange: true)
                    .AddJsonFile($"sharedSettings.{env}.json", optional: true)
                    .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                    .AddJsonFile($"appsettings.{env}.json", optional: false)
                    .AddEnvironmentVariables()
                    .Build();
            }
        }

        public static void Main(string[] args)
        {
            Log.Logger = new Serilog.LoggerConfiguration()
                .ReadFrom.Configuration(Configuration)
                .Enrich.FromLogContext()
                .CreateLogger();

            try
            {
                Log.Information("Iniciado Web Host");
                CreateHostBuilder(args).Build().Run();
            }
            catch (Exception ex)
            {
                Log.Fatal(ex, "Host terminado inesperadamente");
                throw;
            }
            finally
            {
                Log.CloseAndFlush();
            }
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
             Host.CreateDefaultBuilder(args)
                 .ConfigureWebHostDefaults(webBuilder =>
                 {
                     webBuilder.UseStartup<Startup>()
                     .UseConfiguration(Configuration)
                     .UseSerilog();
                 });
    }
}
