# Stage 1: Build the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY src/MyWebApp/*.csproj ./MyWebApp/
COPY src/MyWebApp.Tests/*.csproj ./MyWebApp.Tests/
RUN dotnet restore ./MyWebApp/MyWebApp.csproj

# Copy everything else and build
COPY src/ ./src/
WORKDIR /app/src/MyWebApp
RUN dotnet publish -c Release -o /app/out

# Stage 2: Runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "MyWebApp.dll"]
