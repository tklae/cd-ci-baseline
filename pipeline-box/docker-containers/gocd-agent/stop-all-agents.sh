#!/bin/bash

for id in `docker ps -f name=gocd-agent* -q`; do
	docker rm -f $id
done
