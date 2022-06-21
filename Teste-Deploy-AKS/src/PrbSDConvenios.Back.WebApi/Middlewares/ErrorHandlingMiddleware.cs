using Microsoft.AspNetCore.Http;
using PrbSDConvenios.Back.Domain.Exceptions;
using PrbSDConvenios.Back.Model.ViewModel;
using Serilog;
using System;
using System.Collections.Generic;
using System.Net;
using System.Text.Json;
using System.Threading.Tasks;

namespace PrbSDConvenios.Back.WebApi.Middlewares
{
    public class ErrorHandlingMiddleware
    {
        private readonly RequestDelegate _next;

        public ErrorHandlingMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (DomainException ex)
            {
                await HandleDomainExceptionAsync(context, ex);
            }
            catch (Exception ex)
            {
                await HandleExceptionAsync(context, ex);
            }
        }

        private Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            const string codigoDeErro = "ERRO_INTERNO_DO_SERVIDOR";
            const string mensagemGenerica = "Ops, erro interno do servidor";

            Log.Error(exception, $"{mensagemGenerica} | {exception.Message}");

            var erros = new List<ErroViewModel>
                {
                    new ErroViewModel(codigoDeErro, mensagemGenerica)
                };

            return HandleResponseMessageAsync(context, erros, HttpStatusCode.InternalServerError);
        }

        private Task HandleDomainExceptionAsync(HttpContext context, DomainException exception)
        {
            var erros = new List<ErroViewModel>()
                    {
                        new ErroViewModel(exception.Message,exception.ErrorCode)
                    };

            return HandleResponseMessageAsync(context, erros, HttpStatusCode.BadRequest);
        }

        private static Task HandleResponseMessageAsync(HttpContext context, IEnumerable<ErroViewModel> erros, HttpStatusCode httpStatusCode)
        {
            var options = new JsonSerializerOptions
            {
                PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
                WriteIndented = true
            };

            var result = JsonSerializer.Serialize(erros, options);

            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)httpStatusCode;
            return context.Response.WriteAsync(result);
        }
    }
}