#!/bin/bash

host_ip_addr=${HOST_IP_ADDR:-12.12.12.12}

curl http://${host_ip_addr}:8153/go/api/admin/config.xml > old-config.xml

old_config_checksum=`cat old-config.xml | md5sum | cut -d'-' -f1 | tr -d ' '`
old_config_server_id=`cat old-config.xml | grep -o "serverId=\".*\""|cut -d'"' -f 2`

cat config/cruise-config.xml|sed -e "s|serverId=\".*\"|serverId=\"${old_config_server_id}\"|" > new-config.xml

curl -X post -d "xmlFile=`cat new-config.xml`" -d "md5=${old_config_checksum}" http://${host_ip_addr}:8153/go/api/admin/config.xml

rm -f new-config.xml old-config.xml
