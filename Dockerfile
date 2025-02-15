# .NET runtime és SDK
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Projekt fájl bemásolása és függőségek letöltése
COPY ["MyApi.csproj", "./"]
RUN dotnet restore

# A teljes kód bemásolása és buildelése
COPY . .
RUN dotnet publish -c Release -o /app/publish

# Futtatható alkalmazás beállítása
FROM runtime AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "MyApi.dll"]
