FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source
COPY ConversaoPeso.Web.csproj ./
RUN dotnet restore
COPY . .
RUN dotnet publish -c release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS final
WORKDIR /app
COPY --from=build /app ./
EXPOSE 5000
ENTRYPOINT ["dotnet", "ConversaoPeso.Web.dll"]