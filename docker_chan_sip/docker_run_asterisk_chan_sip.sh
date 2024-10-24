#!/bin/bash

# Run instance with number 2 with version image Asterisk 20.10.0
# bash docker_run_asterisk_chan_sip.sh 2 20.10.0

if [ -z "$1" ]; then
  instance_name=asterisk_docker-0
  # echo "No instance number. Use 0-9. Example docker_run_asterisk_chan_sip.sh 2"
else
  instance_name=asterisk_docker-$1
fi

if [ -z "$2" ]; then
  version=20.10.0
  # echo "No version" && exit 0
else
  version=$2
fi

if [ -f "/usr/bin/docker" ]; then
  docker_path="/usr/bin/docker"
elif [ -f "/run/host/bin/docker" ]; then
  docker_path="/run/host/bin/docker"
elif [ -f "/run/local/bin/docker" ]; then
  docker_path="/run/local/bin/docker"
else
  echo "No found docker in /usr/bin/docker or /run/host/bin/docker" && exit 0
fi

${docker_path} stop "$instance_name"
${docker_path} rm "$instance_name"

host_conf_path="/etc/$instance_name" && mkdir -p "$host_conf_path"
host_logs_path="/var/log/$instance_name" && mkdir -p "$host_logs_path"
host_custom_sounds="/var/lib/asterisk/sounds/en/custom" && mkdir -p "$host_custom_sounds"
host_custom_moh="/var/lib/asterisk/moh" && mkdir -p "$host_custom_moh"

${docker_path} run \
  -d \
  --restart=always \
  --net=host \
  -v "$host_logs_path":/var/log/asterisk/ \
  -v "$host_conf_path":/etc/asterisk \
  -v "$host_custom_sounds":"$host_custom_sounds" \
  -v "$host_custom_moh":"$host_custom_moh" \
  -v /tmp/:/tmp/ \
  --name "$instance_name" \
  anydict/asterisk20ubuntu22:"$version"
