# Go CD Agent

## Building and running the box

* ./build.sh
* ./run.sh

## Further info

Based on the setup shown here: 
https://registry.hub.docker.com/u/extraordinaire/docker-gocd-agent/

If you're running gocd agent on a different host, simply run the agent container like so
`docker run -i gocd-agent -e SERVER_PORT_8153_TCP_ADDR=<HOST OF GOCD SERVER> -e SERVER_PORT_8153_TCP_PORT=<PORT SERVER LISTENING ON>`