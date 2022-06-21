using Microsoft.AspNetCore.Http;
using Serilog;
using System.Diagnostics.CodeAnalysis;
using System.IO;
using System.Threading.Tasks;

namespace PrbSDConvenios.Back.WebApi.Middlewares
{
    [ExcludeFromCodeCoverage]
    public class TelemetryMiddleware : IMiddleware
    {
        private static bool IsRequestWithBody(HttpRequest r) => r.Method == HttpMethods.Post || r.Method == HttpMethods.Put;

        public async Task InvokeAsync(HttpContext context, RequestDelegate next)
        {
            var request = context.Request;

            if (IsRequestWithBody(request) && !request.ContentType.Contains("multipart/form-data"))
            {
                var requestBody = this.GetRequestBodyForTelemetry(context);
                Log.Information($"Request Body: {requestBody}");
            }

            var responseBody = await this.GetResponseBodyForTelemetry(context, next);
            if (!string.IsNullOrEmpty(responseBody))
                Log.Information($"Response Body: {responseBody}");
        }

        public string GetRequestBodyForTelemetry(HttpContext context)
        {
            var request = context.Request;
            request.EnableBuffering();
            request.Body.Position = 0;
            var sr = new StreamReader(request.Body);
            var bodyContent = sr.ReadToEnd();
            request.Body.Position = 0;


            return bodyContent;
        }
        public async Task<string> GetResponseBodyForTelemetry(HttpContext context, RequestDelegate next)
        {
            Stream originalBody = context.Response.Body;
            try
            {
                using (var memStream = new MemoryStream())
                {
                    context.Response.Body = memStream;

                    //await the responsebody
                    await next(context);
                    if (context.Response.StatusCode == 204)
                    {
                        return null;
                    }
                    memStream.Position = 0;
                    var responseBody = new StreamReader(memStream).ReadToEnd();

                    memStream.Position = 0;
                    await memStream.CopyToAsync(originalBody);

                    return responseBody;
                }
            }
            finally
            {
                context.Response.Body = originalBody;
            }
        }
    }
}
