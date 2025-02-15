# 1️⃣ .NET SDK a buildhez
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# 2️⃣ API fájlok bemásolása
COPY MyApi/*.csproj ./MyApi/
RUN dotnet restore MyApi/MyApi.csproj

# 3️⃣ Teljes projekt bemásolása és build
COPY MyApi/ ./MyApi/
WORKDIR /src/MyApi
RUN dotnet publish -c Release -o /app/publish

# 4️⃣ Runtime környezet beállítása
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .

# 5️⃣ Indítás
ENTRYPOINT ["dotnet", "MyApi.dll"]
