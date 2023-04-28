# asterisk_example
Scratches for a quick launch of asterisk

Link to the dockerhub image Asterisk 20.2.0 on Ubuntu 22.04:<br>
https://hub.docker.com/r/anydict/asterisk20ubuntu22


Easy way for run docker image:
<code>
bash docker/docker_run_asterisk.sh 0
</code>

Put configs in the directory:
<code>
cp config/* /etc/asterisk_docker-0/ && docker restart asterisk_docker-0
</code>

