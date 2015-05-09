#!/bin/bash

host_ip_addr=${HOST_IP_ADDR:-12.12.12.12}

curl "http://${host_ip_addr}:8153/go/api/agents" > agents.json

for uuid in `cat agents.json | jq -r -M ". | map(.uuid)" | grep '"'  | cut -d'"' -f2`
do
  curl -d "" http://${host_ip_addr}:8153/go/api/agents/${uuid}/enable
done;

rm -f agents.json
