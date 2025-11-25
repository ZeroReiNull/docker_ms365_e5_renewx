FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base

LABEL maintainer="ZeroReiNull"

WORKDIR /renewx

COPY Microsoft365_E5_Renew_X/. .

FROM mcr.microsoft.com/dotnet/aspnet:3.1

ENV TZ=America/New_York

WORKDIR /renewx

EXPOSE 8066

COPY --from=base /renewx .

ENTRYPOINT ["dotnet", "Microsoft365_E5_Renew_X.dll"]