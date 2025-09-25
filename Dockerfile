# Imagem base de runtime
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Imagem de build
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src

# Copia a solution e os projetos
COPY . .

# Restaura dependências
RUN dotnet restore "WebApi/WebApi.csproj"

# Build
RUN dotnet build "WebApi/WebApi.csproj" -c Release -o /app/build

# Publish
FROM build AS publish
RUN dotnet publish "WebApi/WebApi.csproj" -c Release -o /app/publish

# Imagem final
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebApi.dll"]