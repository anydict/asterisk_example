#!/bin/bash

# Run instance with number 2 with version image Asterisk 18.1.1
# bash docker_run_asterisk.sh 2 18.1.1

if [ -z "$1" ]; then
  instance_name=asterisk_extapi-0
  # echo "No instance number. Use 0-9. Example docker_run_asterisk 2" && exit 0
else
  instance_name=asterisk_extapi-$1
fi

if [ -z "$2" ]; then
  version=20.2.0
  # echo "No version" && exit 0
else
  version=$2
fi

/run/host/bin/docker stop "$instance_name"
/run/host/bin/docker rm "$instance_name"

host_conf_path="/etc/$instance_name" && mkdir -p "/etc/$instance_name"
host_logs_path="/var/log/$instance_name" && mkdir -p "/var/log/$instance_name"

/run/host/bin/docker run \
  -d \
  --restart=always \
  --net=host \
  -v "$host_logs_path":/var/log/asterisk/ \
  -v "$host_conf_path":/etc/asterisk \
  -v /tmp/:/tmp/ \
  --name "$instance_name" \
  asterisk20v5:latest
  #anydict/asterisk:"$version"

