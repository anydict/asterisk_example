#!/bin/bash

# Run instance with number 2 with version image Asterisk 20.2.0
# bash docker_run_asterisk.sh 2 20.2.0

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

if [ -f "/usr/bin/docker" ]; then
  docker_path="/usr/bin/docker"
elif [ -f "/run/host/bin/docker" ]; then
  docker_path="/run/host/bin/docker"
else
  echo "No found docker in /usr/bin/docker or /run/host/bin/docker" && exit 0
fi

${docker_path} stop "$instance_name"
${docker_path} rm "$instance_name"

host_conf_path="/etc/$instance_name" && mkdir -p "/etc/$instance_name"
host_logs_path="/var/log/$instance_name" && mkdir -p "/var/log/$instance_name"
host_custom_sounds="/var/lib/asterisk/sounds/en/custom" && mkdir -p $host_custom_sounds
host_custom_moh="/var/lib/asterisk/moh" && mkdir -p && mkdir -p $host_custom_moh

if [ ! -f "/etc/$instance_name/modules.conf" ]; then
  echo '[modules]' >> "/etc/$instance_name/modules.conf"
  echo 'autoload=yes' >> "/etc/$instance_name/modules.conf"
fi

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
