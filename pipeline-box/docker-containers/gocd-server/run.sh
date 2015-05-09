#!/bin/bash

script_dir=`dirname $0`

docker run -t -d -p 8153:8153 -p 8154:8154 --name="gocd-server" gocd-server:1.0 \
&& bash ${script_dir}/serverAvailable.sh
