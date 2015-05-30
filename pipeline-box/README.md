# Setup instructions

## Prerequisites

 - VirtualBox (tested with Version 4.3.28)
 - Vagrant (tested with Version 1.7.2)
 
## Starting the Pipeline Box VM

- Run ```vagrant up``` from the root folder (the one where the Vagrantfile is located)

## Starting the go.cd server docker container

- ```vagrant ssh``` to ssh into the VM
- ```cd /docker-containers/gocd-server```
- ```./build.sh``` to configure and build the container
- ```./run.sh``` to run the container, wait for the web interface to be available and upload a basic configuration file
- ```docker ps``` to check if the container is running
- The web interface should be available at ```http://localhost:8153```

## Starting the go.cd agent docker container

- ```vagrant ssh``` to ssh into the VM
- ```cd /docker-containers/gocd-agent```
- ```./build.sh``` to configure and build the container
- Make sure the go.cd server is running
- ```./run.sh``` to run the container and autoregister itself with the go.cd server
- ```docker ps``` to check if the container is running
- To check if the agent is available, go to ```http://localhost:8153/go/agents```
- If the agent status is *pending*, mark the row and click *enable* to set it to *idle* and thereby ready for work