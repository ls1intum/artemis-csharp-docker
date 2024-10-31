FROM mcr.microsoft.com/dotnet/sdk:8.0 AS cacher

WORKDIR /project

COPY test.csproj .
RUN dotnet restore


FROM mcr.microsoft.com/dotnet/sdk:8.0 AS final

COPY --from=cacher /root/.nuget/packages /root/.nuget/packages/
