# docker-kubernetes-azure-cicd-demo


This is a pilot project to demonstrate a Docker container with a dotnet 4.7 test application and a CI/CD pipeline to deploy on Azure AKS (Managed Kubernetes service)
The Docker file will basically get a Docker Image from mcr.microsoft.com/windows/servercore/iis and configurate the IIS to host a dotnet framework 4.7 application.
Then it will copy the project files to the new image and build the container.

Currently, there is no dotnet application, just html files to illustrate.


In this same project, there is another Docker file to copy a powershell script to an image and build a container that will execute this powershell command on initialization. The goals is to demonstrate a container that can run powershell commands when it is started.
