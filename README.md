# Demonstration of a Docker container deployed to Azure Kubernetes management system

## iis folder:
This is a pilot project to demonstrate a Docker container with a dotnet 4.7 test application and a CI/CD pipeline to deploy on Azure AKS (Managed Kubernetes service)
The Docker file will basically get a Docker Image from mcr.microsoft.com/windows/servercore/iis and configurate the IIS to host a dotnet framework 4.7 application.
Then it will copy the project files to the new image and build the container.

Currently, there is no dotnet application, just html files to illustrate.

## powershell folder:
In this same project, there is another Docker file to copy a powershell script to an image and build a container that will execute this powershell command on initialization. The goals is to demonstrate a container that can run powershell commands when it is started.


## Docker commands

### To Build a Docker Image from your DockerFile
docker build -t [Your DockerHub username]/[project name]:[version] .

docker build -t danielmelolumen/docker-aks-emea-webapp:1.0 .

### List existent images
docker images

### Create and run a new container from your built image
–d to be detached from the command prompt (otherwise it will block and be attached to it), 
-p to map the local_machine_port:container_port

ATTENCION: the container_port must match the IIS (or other webserver) port for your application specified on your Dockerfile.

When you use your browser locally to access the application, use the local_machine_port
To setup IIS bindings, firewalls, etc, on the container, use the container_port
-name the name you want to give your new container
Last param: the tag name you gave to the image

docker run -d -p 8081:8081 --name  dockerAksEmeaWebapp  danielmelolumen/docker-aks-emea-webapp:1.0


After running, if your container has a webapp, for example, you can try to access on the local machine port:
http://localhost:8081/

### NOTES: 
#### 1) if you are running the GlobalProtect VPN you might not be able to access the container.
#### 2) If you deploy this container to the cloud, make sure that the selected port is open on the cloud environment firewall, and the container is exposed publicly, and has a public ip.


## Other useful commands

### List containers:
docker ps 

### List container and images:
docker ps –all

### Run the container on interactive mode (with access to powershell, cmd or bash, for example):
docker run –it danielmelolumen/dotnetApp:1.0

### Inspect the container logs:
docker inspect [container_id]

Find the container id using “docker ps”.  
On the inspect command, you can use just the first characters that distinguishes your container.
