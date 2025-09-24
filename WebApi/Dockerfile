#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

# Instruções de Inicialização no README.MD

# Base image
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Build image
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src

COPY ["WebApi.csproj", "./"]
RUN dotnet restore "WebApi.csproj"

COPY . .
RUN dotnet build "WebApi.csproj" -c Release -o /app/build

# Publish image
FROM build AS publish
RUN dotnet publish "WebApi.csproj" -c Release -o /app/publish

# Final image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebApi.dll"]

