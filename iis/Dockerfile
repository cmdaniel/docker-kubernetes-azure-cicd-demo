# escape=`

# FROM microsoft/iis:10.0.14393.206
FROM mcr.microsoft.com/windows/servercore/iis
SHELL ["powershell", "-command"]

# Install ASP.NET
RUN Install-WindowsFeature NET-Framework-45-ASPNET; `
    Install-WindowsFeature Web-Asp-Net45

# Install SQL Server LocalDB
# RUN Invoke-WebRequest -OutFile c:\SqlLocalDB.msi -Uri http://download.microsoft.com/download/8/D/D/8DD7BDBA-CEF7-4D8E-8C16-D9F69527F909/ENU/x64/SqlLocalDB.MSI
# RUN ["cmd", "/S", "/C", "c:\\windows\\syswow64\\msiexec", "/i", "c:\\SqlLocalDB.msi", "IACCEPTSQLLOCALDBLICENSETERMS=YES", "/qn"]
# RUN & 'C:\Program Files\Microsoft SQL Server\110\Tools\Binn\sqllocaldb' start "v11.0"

# Configure website
EXPOSE 8081
RUN Remove-Website -Name 'Default Web Site'; `
    md c:\test-app; `
    md c:\databases; `
    New-Website -Name 'test-app' `
                -Port 8081 -PhysicalPath 'c:\test-app' `
                -ApplicationPool '.NET v4.5'

# Setup app pool for LocalDB access
# RUN Import-Module WebAdministration; `
#     Set-ItemProperty 'IIS:\AppPools\.NET v4.5' -Name 'processModel.loadUserProfile' -Value 'True'; `
#     Set-ItemProperty 'IIS:\AppPools\.NET v4.5' -Name 'processModel.setProfileEnvironment' -Value 'True'

# Unlock custom config -- comment or not?
# RUN & c:\windows\system32\inetsrv\appcmd.exe `
#       unlock config `
#       /section:system.webServer/handlers

COPY test-app c:\test-app


#setup Remote IIS management

RUN Install-WindowsFeature Web-Mgmt-Service; `
    New-ItemProperty -Path HKLM:\software\microsoft\WebManagement\Server -Name EnableRemoteManagement -Value 1 -Force; `
    Set-Service -Name wmsvc -StartupType automatic;

#Add user for Remote IIS Manager Login

RUN net user iisadmin ekcjJd@dfk32 /ADD; `
    net localgroup administrators iisadmin /add;