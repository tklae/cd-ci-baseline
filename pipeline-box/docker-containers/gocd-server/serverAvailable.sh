#!/bin/bash

target_ip=localhost
counter=40

while [ $counter -gt 0 ]
do
  counter=$(( $counter - 1 ))
  STATUS=$(curl -s -o /dev/null -w '%{http_code}' "${target_ip}:8153/go/admin/config_xml")
  if [ $STATUS -eq 200 ]; then
    echo "Got 200! All done!"
    exit 0
  else
    echo "Got $STATUS. Retrying ${counter} times"
  fi
  sleep 5
done
exit 1
