#!/bin/bash

target_ip=${HOST_IP_ADDR:-12.12.12.12}

curl http://${target_ip}:8153/go/api/admin/config.xml | grep -v "\<agent" > config/cruise-config.xml
