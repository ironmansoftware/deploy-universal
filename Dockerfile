FROM mcr.microsoft.com/powershell
COPY action.ps1 /action.ps1
ENTRYPOINT ["pwsh", "-File /action.ps1"]
