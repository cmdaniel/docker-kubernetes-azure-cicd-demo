# FROM mcr.microsoft.com/windows/servercore/iis
# FROM mcr.microsoft.com/windows/nanoserver:10.0.19042.1766-amd64
# FROM i386/alpine:20220328

FROM mcr.microsoft.com/windows:10.0.19042.1826
SHELL ["powershell", "-command"]

# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2
RUN Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

COPY print-env.ps1 c:\\print-env.ps1
CMD ["powershell.exe", "c:\\print-env.ps1"]
