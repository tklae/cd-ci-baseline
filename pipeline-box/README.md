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
- To check if the agent is available, click on *AGENTS* or go directly to ```http://localhost:8153/go/agents```
- If the agent status is *pending*, mark the row and click *enable* to set it to *idle* and thereby ready for work

## Export a pipeline configuration (.xml file)

- Under the *Admin* label, you will find a link to *Config XML*, which brings you to ```http://localhost:8153/go/admin/config_xml```
- Copy and paste the xml data to a external file

## Import a pipeline configuration (.xml file)

- Under the *ADMIN* label, you will find a link to *Config XML*, which brings you to ```http://localhost:8153/go/admin/config_xml```
- Before copying over a new .xml configuration, make sure you write down (via copy/paste) the *serverId* (usually found on the third line, as an attribute under the <server> element) of the current server
- Click on *Edit* to start editing the configuration
- Overwrite the whole configuration with a new xml configuration (for example from /pipeline-box/pipeline-configs/)
- Replace the attribute *serverId* from the <server> element with the id from the current server (which you wrote down 4 steps ago)
- *Save* the new configuration
- You possibly have to re-*enable* the agent after overwriting the server configuration (if you did overwrite the <agents> part at the end of the old pipeline configuration). Just wait a few seconds and the current agent(s) will reappear in the list under *AGENTS* (see step **Starting the go.cd agent docker container**)