#!/bin/bash

host_ip_addr=${HOST_IP_ADDR:-12.12.12.12}

curl "http://${host_ip_addr}:8153/go/api/agents" |jq .
