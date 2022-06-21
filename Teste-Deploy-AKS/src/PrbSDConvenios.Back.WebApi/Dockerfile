FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
USER root
RUN apt-get update -y
RUN apt-get install -y gss-ntlmssp
WORKDIR /src
COPY . .
COPY NuGet.Config /root/.nuget/NuGet/
ENV DOTNET_SYSTEM_NET_HTTP_USESOCKETSHTTPHANDLER=0
WORKDIR /src/src/PrbSDConvenios.Back.WebApi
RUN dotnet restore
RUN dotnet build -c Release -o /app
RUN dotnet publish -c Release -o /app

FROM registry.redhat.io/dotnet/dotnet-31-runtime-rhel7:latest AS final
USER root
RUN ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
USER default
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["/opt/rh/rh-dotnet31/root/usr/bin/dotnet", "PrbSDConvenios.Back.WebApi.dll"]