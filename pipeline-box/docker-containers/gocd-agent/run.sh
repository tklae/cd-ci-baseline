#!/bin/bash

script_dir=`dirname $0`

docker run -t -d -p 9080:9080 --name="gocd-agent1" --link gocd-server:server --env GO_AUTO_REGISTER_KEY=goGoCD gocd-agent:1.0
