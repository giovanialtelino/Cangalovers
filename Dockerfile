#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 843

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["CangaLovers.csproj", "."]
RUN dotnet restore "./CangaLovers.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "CangaLovers.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CangaLovers.csproj" -c Release -o /app/publish 
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
EXPOSE 80
ENV ASPNETCORE_URLS=http://+:80
ENTRYPOINT ["dotnet", "CangaLovers.dll"]
