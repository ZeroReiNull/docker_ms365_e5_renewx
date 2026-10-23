FROM mcr.microsoft.com/dotnet/aspnet:3.1

LABEL maintainer="ZeroReiNull"

ENV TZ=America/New_York

WORKDIR /renewx

COPY Microsoft365_E5_Renew_X/ ./

EXPOSE 8066

ENTRYPOINT ["dotnet", "Microsoft365_E5_Renew_X.dll"]
